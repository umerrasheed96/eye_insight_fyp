#!/bin/bash
echo "========================================"
echo "   Image Classifier - Backend Start"
echo "========================================"

cd backend
echo "[1/2] Python packages install ho rahe hain..."
pip install -r requirements.txt

echo ""
echo "[2/2] Server start ho raha hai..."
echo "Backend: http://localhost:8000"
echo ""
uvicorn main:app --reload --port 8000
