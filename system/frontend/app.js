const API_BASE = "http://localhost:8000";

const fileInput      = document.getElementById("fileInput");
const uploadZone     = document.getElementById("uploadZone");
const previewSection = document.getElementById("previewSection");
const previewImg     = document.getElementById("previewImg");
const clearBtn       = document.getElementById("clearBtn");
const classifyBtn    = document.getElementById("classifyBtn");
const loader         = document.getElementById("loader");
const mainResult     = document.getElementById("mainResult");
const resultsSection = document.getElementById("resultsSection");
const resultsList    = document.getElementById("resultsList");
const errorBox       = document.getElementById("errorBox");
const statusBadge    = document.getElementById("status-badge");
const disclaimer     = document.getElementById("disclaimer");

let selectedFile = null;

// Colors per class
const CLASS_COLORS = {
  "DME":    "#ef4444",
  "DRUSEN": "#f59e0b",
  "NORMAL": "#10b981",
};

// ── Health Check ──────────────────────────────────────────────────────────
async function checkHealth() {
  try {
    const res = await fetch(`${API_BASE}/health`, { signal: AbortSignal.timeout(3000) });
    const data = await res.json();
    statusBadge.textContent = data.model_loaded ? "🟢 Online" : "⚠️ Model Missing";
    statusBadge.className   = "badge " + (data.model_loaded ? "online" : "offline");
  } catch {
    statusBadge.textContent = "🔴 Offline";
    statusBadge.className   = "badge offline";
  }
}
checkHealth();
setInterval(checkHealth, 10000);

// ── Drag & Drop ───────────────────────────────────────────────────────────
uploadZone.addEventListener("dragover", (e) => { e.preventDefault(); uploadZone.classList.add("dragover"); });
uploadZone.addEventListener("dragleave", () => uploadZone.classList.remove("dragover"));
uploadZone.addEventListener("drop", (e) => {
  e.preventDefault();
  uploadZone.classList.remove("dragover");
  const file = e.dataTransfer.files[0];
  if (file && file.type.startsWith("image/")) handleFile(file);
});
uploadZone.addEventListener("click", () => fileInput.click());
fileInput.addEventListener("change", () => { if (fileInput.files[0]) handleFile(fileInput.files[0]); });

function handleFile(file) {
  selectedFile = file;
  previewImg.src = URL.createObjectURL(file);
  uploadZone.style.display    = "none";
  previewSection.style.display = "block";
  classifyBtn.disabled = false;
  hideResults();
}

clearBtn.addEventListener("click", () => {
  selectedFile = null;
  fileInput.value = "";
  previewImg.src = "";
  uploadZone.style.display    = "flex";
  previewSection.style.display = "none";
  classifyBtn.disabled = true;
  hideResults();
});

// ── Classify ──────────────────────────────────────────────────────────────
classifyBtn.addEventListener("click", async () => {
  if (!selectedFile) return;
  showLoader(true);
  hideResults();

  const formData = new FormData();
  formData.append("file", selectedFile);

  try {
    const res  = await fetch(`${API_BASE}/predict`, { method: "POST", body: formData });
    const data = await res.json();

    if (!res.ok) {
      showError(data.detail || "Server se koi response nahi mila.");
    } else {
      showResults(data);
    }
  } catch (err) {
    showError(`Backend se connect nahi ho saka. Server chal raha hai?\n(${err.message})`);
  } finally {
    showLoader(false);
  }
});

// ── UI Helpers ────────────────────────────────────────────────────────────
function showLoader(show) {
  loader.style.display  = show ? "block" : "none";
  classifyBtn.disabled  = show;
}

function hideResults() {
  mainResult.style.display     = "none";
  resultsSection.style.display = "none";
  errorBox.style.display       = "none";
  disclaimer.style.display     = "none";
  resultsList.innerHTML        = "";
}

function showError(msg) {
  errorBox.textContent   = "❌ " + msg;
  errorBox.style.display = "block";
}

function showResults(data) {
  // Main diagnosis card
  const sev     = data.severity || "Unknown";
  const sevClass = sev === "High" ? "severity-high" : sev === "Medium" ? "severity-medium" : "severity-none";
  const color   = CLASS_COLORS[data.diagnosis] || "#6366f1";

  document.getElementById("severityBadge").textContent  = sev === "None" ? "✅ Healthy" : `⚠️ ${sev} Risk`;
  document.getElementById("severityBadge").className    = `severity-badge ${sevClass}`;
  document.getElementById("diagnosisName").textContent  = data.diagnosis;
  document.getElementById("diagnosisFull").textContent  = data.full_name;
  document.getElementById("confidenceVal").textContent  = `${data.confidence}%`;
  document.getElementById("descriptionBox").textContent = data.description;

  const bar = document.getElementById("mainBar");
  bar.style.background = color;
  setTimeout(() => { bar.style.width = `${data.confidence}%`; }, 50);

  mainResult.style.display = "block";

  // All predictions
  if (data.predictions && data.predictions.length > 1) {
    resultsList.innerHTML = data.predictions.map(p => {
      const c = CLASS_COLORS[p.label] || "#6366f1";
      return `
        <div class="result-item">
          <div class="result-item-header">
            <span class="r-label">${p.label} — ${p.full_name}</span>
            <span class="r-conf">${p.confidence}%</span>
          </div>
          <div class="bar-bg-sm">
            <div class="bar-fill-sm" style="width:${p.confidence}%; background:${c}"></div>
          </div>
        </div>
      `;
    }).join("");
    resultsSection.style.display = "block";
  }

  disclaimer.style.display = "block";
}
