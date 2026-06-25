#!/bin/bash
set -euo pipefail

echo "==> Checking prerequisites..."
command -v flux >/dev/null 2>&1 || { echo "flux CLI required"; exit 1; }

echo "==> Bootstrapping Flux..."
flux bootstrap github \
  --owner="${GITHUB_USER}" \
  --repository="${REPO_NAME}" \
  --branch=main \
  --path=./clusters \
  --personal=true \
  --private=false

echo "==> Applying Kustomizations..."
kubectl apply -f flux/kustomizations/

echo "==> Applying ImageUpdateAutomation..."
kubectl apply -f flux/image-update.yaml

echo "==> Done! Flux is syncing from ${REPO_NAME}."
