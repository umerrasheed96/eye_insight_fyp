# 🧠 Image Classifier — FastAPI + PyTorch

## 📁 Folder Structure

```
image-classifier/
├── backend/
│   ├── main.py              ← FastAPI server
│   ├── requirements.txt     ← Python packages
│   └── model/
│       ├── model.pt         ← ✅ APNI .pt FILE YAHAN RAKHEIN
│       └── labels.json      ← Class names (edit karo apne hisaab se)
└── frontend/
    ├── index.html           ← Main page
    ├── style.css            ← Styling
    └── app.js               ← JavaScript logic
```

---

## ⚙️ Setup Steps

### Step 1 — Apni Model File Rakhein
```
backend/model/model.pt    ← Apni .pt file yahan copy karein
```

### Step 2 — Labels Update Karein
`backend/model/labels.json` mein apne class names likhein:
```json
["cat", "dog", "bird", "car", "flower"]
```

### Step 3 — Backend Chalao

```bash
cd backend
pip install -r requirements.txt
uvicorn main:app --reload --port 8000
```

### Step 4 — Frontend Chalao

```bash
cd frontend
# Option A: Simple way (VS Code Live Server use karo)
# Option B: Python se
python -m http.server 5500
```

Browser mein open karo: **http://localhost:5500**

---

## 🔧 Agar Model Architecture Alag Ho

Agar tumhara model custom architecture use karta hai, to `backend/main.py` mein
`load_model()` function ke andar **Try 2** section mein apni architecture likhein:

```python
# Example: Custom model
from your_model_file import MyModel
base = MyModel(num_classes=10)
state = torch.load(MODEL_PATH, map_location=DEVICE)
base.load_state_dict(state)
model = base
```

---

## 🧪 API Test (Optional)

Backend chal raha hai to directly test kar sakte ho:
```bash
curl -X POST http://localhost:8000/predict \
  -F "file=@your_image.jpg"
```

---

## ❓ Common Issues

| Problem | Solution |
|---|---|
| `Model load nahi hua` | `.pt` file `backend/model/` mein rakhein |
| `CORS error` | Backend chal raha hai check karo |
| `Class 0, Class 1 dikh raha hai` | `labels.json` update karo |
| `Custom architecture error` | `main.py` mein Try 2 block update karo |
