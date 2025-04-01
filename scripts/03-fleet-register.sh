#!/bin/bash

gcloud container clusters update "${PRIMARY_CLUSTER_NAME}" --enable-fleet --zone="${PRIMARY_CLUSTER_ZONE}"

gcloud container clusters update "${SECONDARY_CLUSTER_NAME}" --enable-fleet --zone="${SECONDARY_CLUSTER_ZONE}"
