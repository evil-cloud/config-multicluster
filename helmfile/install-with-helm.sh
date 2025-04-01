#!/bin/bash
helm install asm-gateway . --values values/values-asm-gateway.yaml --namespace asm-gateway --debug --wait --dry-run