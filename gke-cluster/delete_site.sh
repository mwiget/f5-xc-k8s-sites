#!/bin/bash
if [ -f kubeconfig ]; then
  kubectl --kubeconfig kubeconfig delete -f ce_k8s.yml || true
  rm -f kubeconfig
fi
