
```
$ terragrunt init
$ terragrunt apply
. . .

Outputs:

kubernetes_cluster_host = "35.223.79.119"
kubernetes_cluster_name = "f5-distributed-cloud-gke"
project_id = "f5-distributed-cloud"
region = "us-central1"
```

create kubeconfig:

```
gcloud container clusters get-credentials f5-distributed-cloud-gke  --region us-central1
```

show nodes:

```
$ kubectl get nodes -o wide
NAME                                                  STATUS   ROLES    AGE   VERSION            INTERNAL-IP   EXTERNAL-IP      OS-IMAGE                             KERNEL-VERSION   CONTAINER-RUNTIME
gke-f5-distributed-c-f5-distributed-c-220f4573-2wwq   Ready    <none>   42m   v1.21.6-gke.1503   10.10.0.6     34.72.221.89     Container-Optimized OS from Google   5.4.144+         containerd://1.4.8
gke-f5-distributed-c-f5-distributed-c-89ede8fe-p7cv   Ready    <none>   42m   v1.21.6-gke.1503   10.10.0.7     34.122.116.237   Container-Optimized OS from Google   5.4.144+         containerd://1.4.8
gke-f5-distributed-c-f5-distributed-c-d442b8e2-dpjl   Ready    <none>   42m   v1.21.6-gke.1503   10.10.0.5     104.197.25.86    Container-Optimized OS from Google   5.4.144+         containerd://1.4.8
```

## Resources

- https://github.com/hashicorp/learn-terraform-provision-gke-cluster
- https://blog.knoldus.com/how-to-create-gke-on-gcp-using-terraform/ (not used)


```
$ kubectl get pods -o wide -ANAMESPACE     NAME                                                             READY   STATUS    RESTARTS   AGE   IP            NODE                                                  NOMINATED NODE   READINESS GATESkube-system   event-exporter-gke-5479fd58c8-87c5p                              2/2     Running   0          53m   10.124.3.7    gke-f5-distributed-c-f5-distributed-c-d442b8e2-dpjl   <none>           <none>kube-system   fluentbit-gke-64fld                                              2/2     Running   0          47m   10.10.0.6     gke-f5-distributed-c-f5-distributed-c-220f4573-2wwq   <none>           <none>kube-system   fluentbit-gke-85mf5                                              2/2     Running   0          47m   10.10.0.7     gke-f5-distributed-c-f5-distributed-c-89ede8fe-p7cv   <none>           <none>kube-system   fluentbit-gke-pks48                                              2/2     Running   0          47m   10.10.0.5     gke-f5-distributed-c-f5-distributed-c-d442b8e2-dpjl   <none>           <none>kube-system   gke-metrics-agent-7bqxr                                          1/1     Running   0          47m   10.10.0.5     gke-f5-distributed-c-f5-distributed-c-d442b8e2-dpjl   <none>           <none>kube-system   gke-metrics-agent-9xjhs                                          1/1     Running   0          47m   10.10.0.6     gke-f5-distributed-c-f5-distributed-c-220f4573-2wwq   <none>           <none>kube-system   gke-metrics-agent-m6q4p                                          1/1     Running   0          47m   10.10.0.7     gke-f5-distributed-c-f5-distributed-c-89ede8fe-p7cv   <none>           <none>kube-system   konnectivity-agent-6b8b5c7d94-78bc4                              1/1     Running   0          53m   10.124.3.8    gke-f5-distributed-c-f5-distributed-c-d442b8e2-dpjl   <none>           <none>kube-system   konnectivity-agent-6b8b5c7d94-jzlfh                              1/1     Running   0          53m   10.124.3.3    gke-f5-distributed-c-f5-distributed-c-d442b8e2-dpjl   <none>           <none>
kube-system   konnectivity-agent-6b8b5c7d94-zsbxg                              1/1     Running   0          53m   10.124.3.12   gke-f5-distributed-c-f5-distributed-c-d442b8e2-dpjl   <none>           <none>
kube-system   konnectivity-agent-autoscaler-6849fff748-rz5vl                   1/1     Running   0          53m   10.124.3.4    gke-f5-distributed-c-f5-distributed-c-d442b8e2-dpjl   <none>           <none>
kube-system   kube-dns-697dc8fc8b-fsgpc                                        4/4     Running   0          53m   10.124.3.9    gke-f5-distributed-c-f5-distributed-c-d442b8e2-dpjl   <none>           <none>
kube-system   kube-dns-697dc8fc8b-s9f6d                                        4/4     Running   0          53m   10.124.3.10   gke-f5-distributed-c-f5-distributed-c-d442b8e2-dpjl   <none>           <none>
kube-system   kube-dns-autoscaler-844c9d9448-tpd7l                             1/1     Running   0          53m   10.124.3.6    gke-f5-distributed-c-f5-distributed-c-d442b8e2-dpjl   <none>           <none>
kube-system   kube-proxy-gke-f5-distributed-c-f5-distributed-c-220f4573-2wwq   1/1     Running   0          47m   10.10.0.6     gke-f5-distributed-c-f5-distributed-c-220f4573-2wwq   <none>           <none>
kube-system   kube-proxy-gke-f5-distributed-c-f5-distributed-c-89ede8fe-p7cv   1/1     Running   0          47m   10.10.0.7     gke-f5-distributed-c-f5-distributed-c-89ede8fe-p7cv   <none>           <none>
kube-system   kube-proxy-gke-f5-distributed-c-f5-distributed-c-d442b8e2-dpjl   1/1     Running   0          47m   10.10.0.5     gke-f5-distributed-c-f5-distributed-c-d442b8e2-dpjl   <none>           <none>
kube-system   l7-default-backend-69fb9fd9f9-5ff8n                              1/1     Running   0          53m   10.124.3.11   gke-f5-distributed-c-f5-distributed-c-d442b8e2-dpjl   <none>           <none>
kube-system   metrics-server-v0.4.5-bbb794dcc-dhj7t                            2/2     Running   0          53m   10.124.3.2    gke-f5-distributed-c-f5-distributed-c-d442b8e2-dpjl   <none>           <none>
kube-system   pdcsi-node-dkksf                                                 2/2     Running   0          47m   10.10.0.6     gke-f5-distributed-c-f5-distributed-c-220f4573-2wwq   <none>           <none>
kube-system   pdcsi-node-pvpvt                                                 2/2     Running   0          47m   10.10.0.5     gke-f5-distributed-c-f5-distributed-c-d442b8e2-dpjl   <none>           <none>
kube-system   pdcsi-node-xzxqj                                                 2/2     Running   0          47m   10.10.0.7     gke-f5-distributed-c-f5-distributed-c-89ede8fe-p7cv   <none>           <none>
```
