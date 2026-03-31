from ultralytics import YOLO
from PIL import Image

# Model load karo
model = YOLO(r"D:\practices\image-classifier\image-classifier\backend\model\model.pt")

# Koi bhi ek retinal image ka path yahan likho
IMAGE_PATH = r"D:\practices\image-classifier\image-classifier\backend\model\ant.jpg"  # ← koi bhi retinal image yahan rakhо

image = Image.open(IMAGE_PATH).convert("RGB")
results = model(image, verbose=False)
result = results[0]

print("=" * 50)
print("MODEL TYPE CHECK:")
print(f"  probs (classification): {result.probs}")
print(f"  boxes (detection):      {result.boxes}")
print(f"  masks (segmentation):   {result.masks}")
print("=" * 50)

# Agar classification hai
if result.probs is not None:
    print("\n✅ Classification Model hai!")
    print(f"  Top class:      {model.names[result.probs.top1]}")
    print(f"  Confidence:     {result.probs.top1conf:.2%}")
    print(f"  All probs:      {result.probs.data.tolist()}")

# Agar detection hai
if result.boxes is not None and len(result.boxes) > 0:
    print("\n✅ Detection Model hai!")
    for i, box in enumerate(result.boxes):
        cls  = int(box.cls[0])
        conf = float(box.conf[0])
        xyxy = box.xyxy[0].tolist()
        print(f"  Detection {i+1}: {model.names[cls]} — {conf:.2%} — box: {xyxy}")
else:
    print("\n⚠️  Koi detection nahi mili (ya classification model hai)")