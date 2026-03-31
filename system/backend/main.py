import io
import os
from PIL import Image
from fastapi import FastAPI, File, UploadFile, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
from ultralytics import YOLO
import random

app = FastAPI(title="Retinal Disease Classifier API")

# ─── CORS ───────────────────────────────────────────────────────────────────
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

# ─── Config ─────────────────────────────────────────────────────────────────
MODEL_PATH = "model/model.pt"   # apni .pt file yahan rakhein

def random_text():
    texts = [
        "Hello world!",
        "Python is fun",
        "OpenAI is amazing",
        "I love coding",
        "Have a great day",
        "Keep learning",
        "Random text generator",
        "Stay positive",
        "Work hard, play hard",
        "Success is near"
    ]
    return random.choice(texts)

# ─── Disease Info ────────────────────────────────────────────────────────────
DISEASE_INFO = {
    "DME": {
        "full_name": "Diabetic Macular Edema detected.",
        "description": "Fluid leaks from the blood vessels in the retina, causing swelling in the macula.",
        "severity": "High",
        "color": "#ef4444"
    },
    "DRUSEN": {
        "full_name": "Drusen deposits detected.",
        "description": "Yellow deposits under the retina are an early sign of Age-related Macular Degeneration.",
        "severity": "Medium",
        "color": "#f59e0b"
    },
    "NORMAL": {
        "full_name": "Normal / Healthy",
        "description": "Retina bilkul theek hai, koi disease detect nahi hui.",
        "severity": "None",
        "color": "#10b981"
    },
}

# ─── Model Load ──────────────────────────────────────────────────────────────
model = None

def load_model():
    global model
    if not os.path.exists(MODEL_PATH):
        print(f"[WARNING] Model file not found: {MODEL_PATH}")
        return
    try:
        model = YOLO(MODEL_PATH)
        print(f"[OK] YOLO Model loaded — Classes: {model.names}")
    except Exception as e:
        print(f"[ERROR] Model load failed: {e}")

load_model()

# ─── Routes ──────────────────────────────────────────────────────────────────
@app.get("/")
def root():
    return {
        "status": "running",
        "model_loaded": model is not None,
        "classes": model.names if model else None,
    }

@app.get("/health")
def health():
    return {"status": "ok", "model_loaded": model is not None}

@app.post("/predict")
async def predict(file: UploadFile = File(...)):
    if model is None:
        raise HTTPException(
            status_code=503,
            detail="Model load nahi hua. model/model.pt rakhein aur server restart karein."
        )

    if not file.content_type.startswith("image/"):
        raise HTTPException(status_code=400, detail="Sirf image files allowed hain.")

    try:
        # Image read
        contents = await file.read()
        image = Image.open(io.BytesIO(contents)).convert("RGB")

        # YOLO Inference
        results = model(image, verbose=False)
        result  = results[0]

        predictions = []

        # ── Classification model (probs available) ──────────────────────
        if result.probs is not None:
            probs = result.probs
            top_indices = probs.top5
            top_confs   = probs.top5conf.tolist()
            for idx, conf in zip(top_indices, top_confs):
                label = model.names[int(idx)]
                info  = DISEASE_INFO.get(label, {})
                predictions.append({
                    "label":       label,
                    "full_name":   info.get("full_name", label),
                    "confidence":  round(conf * 100, 2),
                    "severity":    info.get("severity", "Unknown"),
                    "description": info.get("description", ""),
                    "color":       info.get("color", "#6366f1"),
                })

        # ── Detection model (boxes available) ───────────────────────────
        elif result.boxes is not None and len(result.boxes) > 0:
            # Count detections per class, pick highest confidence per class
            class_best = {}
            for box in result.boxes:
                cls  = int(box.cls[0])
                conf = float(box.conf[0])
                if cls not in class_best or conf > class_best[cls]:
                    class_best[cls] = conf

            # Sort by confidence descending
            sorted_classes = sorted(class_best.items(), key=lambda x: x[1], reverse=True)
            for cls, conf in sorted_classes:
                label = model.names[cls]
                info  = DISEASE_INFO.get(label, {})
                predictions.append({
                    "label":       label,
                    "full_name":   info.get("full_name", label),
                    "confidence":  round(conf * 100, 2),
                    "severity":    info.get("severity", "Unknown"),
                    "description": info.get("description", ""),
                    "color":       info.get("color", "#6366f1"),
                })

        # ── No detections — return Normal ────────────────────────────────
        if not predictions:
            info = DISEASE_INFO.get("NORMAL", {})
            predictions.append({
                "label":       "NORMAL",
                "full_name":   info.get("full_name", "Normal"),
                "confidence":  99.0,
                "severity":    "None",
                "description": info.get("description", "Koi disease detect nahi hui."),
                "color":       "#10b981",
            })

        top = predictions[0]
        return JSONResponse({
            "success":     True,
            "filename":    file.filename,
            "diagnosis":   top["label"],
            "full_name":   top["full_name"],
            "confidence":  top["confidence"],
            "severity":    top["severity"],
            "description": top["description"],
            "predictions": predictions,
        })

    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))