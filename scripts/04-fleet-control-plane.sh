#!/bin/bash

gcloud container fleet mesh update \
    --management=automatic \
    --memberships="${PRIMARY_CLUSTER_NAME},${SECONDARY_CLUSTER_NAME}" \
    --project="${GCP_PROJECT_ID}"
