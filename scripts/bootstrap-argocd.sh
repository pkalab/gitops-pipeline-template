#!/bin/bash
set -euo pipefail

echo "==> Installing ArgoCD..."
kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "==> Waiting for ArgoCD to be ready..."
kubectl wait --for=condition=available --timeout=300s -n argocd deployment/argocd-server

echo "==> Applying root Application..."
kubectl apply -f argocd/root-app.yaml

echo "==> Applying projects..."
kubectl apply -f argocd/projects/

echo "==> Applying ApplicationSets..."
kubectl apply -f argocd/applicationsets/

echo "==> Done! ArgoCD URL: https://$(kubectl get svc -n argocd argocd-server -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')"
echo "==> Password: $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d)"
