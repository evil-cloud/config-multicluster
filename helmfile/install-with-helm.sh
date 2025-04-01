#!/bin/bash

helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update

helm install asm-gateway . --values values/values-asm-gateway.yaml --namespace asm-gateway --debug --wait --dry-run
