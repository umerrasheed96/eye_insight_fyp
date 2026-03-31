# ⚙️ Backend Chalane Ka Tarika

## ✅ Pehli Baar Setup (Sirf Ek Baar)

### Step 1 — Backend Folder Kholo

### Step 2 — CMD Kholo
Address bar mein click karo, `cmd` likho, Enter dabao

![cmd](https://i.imgur.com/placeholder.png)

### Step 3 — Packages Install Karo
```bash
pip install -r requirements.txt
```
> ⏳ 2-3 minute lagenge — ek baar hi karna hai

### Step 4 — Model File Check Karo
Yeh file zaroor honi chahiye:
```
backend/
└── model/
    └── model.pt
```

---

## 🚀 Roz Chalane Ka Tarika

### Sirf Yeh Ek Command:
```bash
uvicorn main:app --reload --port 8000
```

### Yeh Dikhe To Sab Theek Hai ✅
```
[OK] YOLO Model loaded — Classes: {0: 'DME', 1: 'DRUSEN', 2: 'NORMAL'}
INFO:     Uvicorn running on http://127.0.0.1:8000
INFO:     Application startup complete.
```

---

## ⚠️ Zaruri Baatein

| Baat | Detail |
|---|---|
| CMD band mat karo | Jab tak frontend use kar rahe ho |
| Port 8000 free hona chahiye | Koi aur app same port pe na ho |
| PC restart ke baad | Dobara `uvicorn` command chalao |
| Model file | `backend/model/model.pt` honi chahiye |

---

## ❌ Common Errors aur Fix

### Error 1 — Model nahi mila
```
[WARNING] Model file not found: model/model.pt
```
**Fix:** `retinaldetachmentmodel.pt` ko copy karke `backend/model/model.pt` rakho

---

### Error 2 — Port already in use
```
ERROR: [Errno 10048] address already in use
```
**Fix:** Alag port use karo:
```bash
uvicorn main:app --reload --port 8001
```
Aur `frontend/app.js` mein yeh line update karo:
```javascript
const API_BASE = "http://localhost:8001";
```

---

### Error 3 — uvicorn command nahi mili
```
'uvicorn' is not recognized
```
**Fix:**
```bash
pip install uvicorn
```
Ya:
```bash
py -3.11 -m uvicorn main:app --reload --port 8000
```

---

### Error 4 — Module not found
```
ModuleNotFoundError: No module named 'fastapi'
```
**Fix:**
```bash
pip install -r requirements.txt
```

---

## 🔗 Useful Links

| Cheez | URL |
|---|---|
| Backend API | http://localhost:8000 |
| API Docs (Swagger) | http://localhost:8000/docs |
| Health Check | http://localhost:8000/health |
| Download Model WIth Permission | https://drive.google.com/file/d/1QATQWuekI9TJH3186qCp6jEEAYvQ4WVR/view?usp=sharing

> 💡 **Tip:** Browser mein `http://localhost:8000/docs` kholo — wahan se directly API test kar sakte ho bina frontend ke!
