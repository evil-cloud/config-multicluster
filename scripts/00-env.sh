#!/bin/bash

export GCP_PROJECT_ID=$(gcloud config get-value project)
export GCP_PROJECT_NUMBER=$(gcloud projects describe "${GCP_PROJECT_ID}" --format="value(projectNumber)")
export FLEET_PROJECT="${GCP_PROJECT_ID}"
export WORKLOAD_IDENTITY_NAMESPACE="${GCP_PROJECT_ID}.svc.id.goog"

export CURRENT_DIR="."

export PRIMARY_CLUSTER_NAME="gke-us"
export SECONDARY_CLUSTER_NAME="gke-eu"

export PRIMARY_CLUSTER_ZONE="us-central1-a"
export SECONDARY_CLUSTER_ZONE="europe-west1-b"

export PRIMARY_CLUSTER_REGION="us-central1"
export SECONDARY_CLUSTER_REGION="europe-west1"

export CTX_1="gke_${GCP_PROJECT_ID}_${PRIMARY_CLUSTER_ZONE}_${PRIMARY_CLUSTER_NAME}"
export CTX_2="gke_${GCP_PROJECT_ID}_${SECONDARY_CLUSTER_ZONE}_${SECONDARY_CLUSTER_NAME}"

# Verifica que la API mesh.googleapis.com esté habilitada
echo "Verificando que la API mesh.googleapis.com esté habilitada..."
gcloud services enable mesh.googleapis.com --project="${FLEET_PROJECT}"
if [ $? -ne 0 ]; then
    echo "Error al habilitar la API mesh.googleapis.com. Por favor, verifica los permisos."
    exit 1
fi

echo "La API mesh.googleapis.com está habilitada."
