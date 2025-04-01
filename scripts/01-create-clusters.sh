#!/bin/bash

echo "Creando el cluster primario: ${PRIMARY_CLUSTER_NAME} en ${PRIMARY_CLUSTER_ZONE}..."

gcloud container clusters create "${PRIMARY_CLUSTER_NAME}" \
    --project="${GCP_PROJECT_ID}" \
    --machine-type="e2-medium" \
    --num-nodes=4 \
    --preemptible \
    --zone="${PRIMARY_CLUSTER_ZONE}" \
    --disk-size="30GB" \
    --labels="mesh_id=proj-${GCP_PROJECT_ID}" \
    --workload-pool="${WORKLOAD_IDENTITY_NAMESPACE}" \
    --logging=SYSTEM,KCP_HPA,CONTROLLER_MANAGER,SCHEDULER,API_SERVER \
    --monitoring=SYSTEM,API_SERVER,SCHEDULER,CONTROLLER_MANAGER,POD,DEPLOYMENT,STATEFULSET,DAEMONSET,HPA,KUBELET

echo "Creando el cluster secundario: ${SECONDARY_CLUSTER_NAME} en ${SECONDARY_CLUSTER_ZONE}..."

gcloud container clusters create "${SECONDARY_CLUSTER_NAME}" \
    --project="${GCP_PROJECT_ID}" \
    --machine-type="e2-medium" \
    --num-nodes=4 \
    --preemptible \
    --zone="${SECONDARY_CLUSTER_ZONE}" \
    --disk-size="30GB" \
    --labels="mesh_id=proj-${GCP_PROJECT_ID}" \
    --workload-pool="${WORKLOAD_IDENTITY_NAMESPACE}" \
    --logging=SYSTEM,KCP_HPA,CONTROLLER_MANAGER,SCHEDULER,API_SERVER \
    --monitoring=SYSTEM,API_SERVER,SCHEDULER,CONTROLLER_MANAGER,POD,DEPLOYMENT,STATEFULSET,DAEMONSET,HPA,KUBELET
