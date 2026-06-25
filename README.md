# GitOps Pipeline Template

A standardized GitOps pipeline template with dual ArgoCD + Flux CD support,
CI via GitHub Actions, SOPS secrets, and multi-environment deployments.

## Quick Start

1. **Choose your CD tool:**
   - [ArgoCD](./argocd/README.md) — App-of-Apps with ApplicationSets
   - [Flux](./flux/README.md) — Kustomization + HelmRelease + ImageUpdateAutomation

2. **Bootstrap the cluster:**
   ```bash
   make bootstrap-argocd   # or make bootstrap-flux
   ```

3. **Add an application:**
   ```bash
   # Kustomize
   cp -r apps/my-app apps/your-app
   # Edit overlays/dev, staging, prod

   # Helm
   cp -r apps/my-app-chart apps/your-app
   # Edit values/dev.yaml, staging.yaml, prod.yaml
   ```

4. **Commit and push:**
   ```bash
   git add . && git commit -m "Add your-app"
   git push
   ```

## Directory Layout

```
gitops-pipeline-template/
├── apps/              # Application definitions
├── clusters/          # Cluster-specific config per environment
├── kustomize/         # Shared Kustomize bases and overlays
├── helm/              # Shared Helm library charts
├── argocd/            # ArgoCD manifests
├── flux/              # Flux CD manifests
├── .github/           # CI pipeline
├── .sops.yaml         # SOPS encryption config
└── scripts/           # Bootstrap and helper scripts
```

## Prerequisites

- GitHub account
- Kubernetes cluster (EKS, AKS, or GKE)
- `kubectl` and `helm` installed
- `argocd` or `flux` CLI (depending on choice)
