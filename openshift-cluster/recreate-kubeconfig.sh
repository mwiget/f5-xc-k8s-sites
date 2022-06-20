#!/bin/bash
openssl req -new -newkey rsa:4096 -nodes -keyout newauth.key -out newauth.csr -subj "/CN=system:admin"
cat << EOF >> newauth-csr.yaml
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: newauth-access
spec:
  signerName: kubernetes.io/kube-apiserver-client
  groups:
  - system:authenticated
  request: $(cat newauth.csr | base64 | tr -d '\n')
  usages:
  - client auth
EOF
oc create -f newauth-csr.yaml
oc get csr
oc adm certificate approve newauth-access
oc get csr newauth-access -o jsonpath='{.status.certificate}' | base64 -d > newauth-access.crt
oc config set-credentials system:admin --client-certificate=newauth-access.crt --client-key=newauth.key --embed-certs --kubeconfig=/tmp/mynewkubeconfig
oc config set-context system:admin --cluster=$(oc config view -o jsonpath='{.clusters[0].name}') --namespace=default --user=system:admin --kubeconfig=/tmp/mynewkubeconfig
oc -n openshift-authentication  rsh `oc get pods -n openshift-authentication -o name | head -1 `  cat /run/secrets/kubernetes.io/serviceaccount/ca.crt > ingress-ca.crt
oc config set-cluster $(oc config view -o jsonpath='{.clusters[0].name}') --server=$(oc config view -o jsonpath='{.clusters[0].cluster.server}') --certificate-authority=ingress-ca.crt --kubeconfig=/tmp/mynewkubeconfig --embed-certs
oc config use-context system:admin --kubeconfig=/tmp/mynewkubeconfig
oc --kubeconfig=/tmp/mynewkubeconfig get nodes 
