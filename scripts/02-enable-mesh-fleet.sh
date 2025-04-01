#!/bin/bash

gcloud container fleet mesh enable --project $(gcloud config get-value project) \
    --fleet-default-member-config mesh.yaml
