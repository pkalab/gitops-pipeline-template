# GitOps Pipeline Template

A standardized GitOps pipeline template with dual ArgoCD + Flux CD support,
CI via GitHub Actions, SOPS secrets, and multi-environment deployments.

## Quick Start

1. **Choose your CD tool:**
   - [ArgoCD](./argocd/) — App-of-Apps with ApplicationSets
   - [Flux](./flux/) — Kustomization + HelmRelease + ImageUpdateAutomation

2. **Bootstrap the cluster:**
   ```bash
   make bootstrap-argocd   # or make bootstrap-flux
   ```

3. **Commit and push:**
   ```bash
   git add . && git commit -m "Initial commit"
   git push
   ```

## Directory Layout

```
gitops-pipeline-template/
├── clusters/          # Cluster-specific manifests per environment
├── helm/              # Shared Helm library chart
├── argocd/            # ArgoCD manifests
├── flux/              # Flux CD manifests
├── .github/           # CI pipeline
├── .sops.yaml         # SOPS encryption config
└── scripts/           # Bootstrap scripts
```

## Prerequisites

- GitHub account
- Kubernetes cluster (EKS, AKS, or GKE)
- `kubectl` and `helm` installed
- `argocd` or `flux` CLI (depending on choice)
