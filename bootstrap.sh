#!/usr/bin/env bash
set -euo pipefail

echo "== GCP/JX lab bootstrap =="

command -v gcloud >/dev/null || { echo "gcloud nincs meg"; exit 1; }
command -v git >/dev/null || sudo apt-get update && sudo apt-get install -y git
command -v kubectl >/dev/null || gcloud components install kubectl -q
command -v gh >/dev/null || echo "GitHub CLI-t telepíteni kell vagy Cloud Shellben ellenőrizni"
command -v terraform >/dev/null || echo "Terraform telepítés kell"
command -v jx >/dev/null || echo "JX telepítés kell"

gcloud config set compute/region us-central1
gcloud config set compute/zone us-central1-a

gcloud services enable container.googleapis.com
gcloud services enable artifactregistry.googleapis.com
gcloud services enable secretmanager.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com

echo "Kész. Ellenőrizd: gcloud config list"
