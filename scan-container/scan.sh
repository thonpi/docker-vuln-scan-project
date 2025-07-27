#!/bin/bash

IMAGE="my-insecure-app"
RESULTS_DIR="/results"

mkdir -p "$RESULTS_DIR"

echo "[*] Running Trivy..."
trivy image $IMAGE --severity HIGH,CRITICAL > "$RESULTS_DIR/trivy.txt"

echo "[*] Running Grype..."
grype $IMAGE > "$RESULTS_DIR/grype.txt"

echo "[*] Running Dockle..."
dockle $IMAGE > "$RESULTS_DIR/dockle.txt"

echo "[*] Running Hadolint..."
hadolint /app/Dockerfile > "$RESULTS_DIR/hadolint.txt"

echo "[*] Running Gitleaks..."
gitleaks detect --source /app --report-format json --report-path "$RESULTS_DIR/gitleaks.json"

echo "✅ All scans complete. Results saved in /results"
