
Installation instructions: https://docs.openshift.com/container-platform/4.10/installing/installing_vsphere/installing-vsphere-installer-provisioned.html


created 3 DNS A records:

```
$ host ingress.osc1.mwlabs.net
ingress.osc1.mwlabs.net has address 192.168.40.10

$ host api.osc1.mwlabs.net
api.osc1.mwlabs.net has address 192.168.40.11
```

wildcard for \*.apps.osc1.mwlabs.net, pointing to ingress IP


running installer:

```
[mwiget@rog1 install]$ ./openshift-install create cluster --dir osc1
? SSH Public Key /home/mwiget/.ssh/id_ed25519.pub
? Platform vsphere
? vCenter 192.168.40.21
? Username administrator@mwlabs.local
? Password [? for help] ***********
INFO Connecting to vCenter 192.168.40.21          
INFO Defaulting to only available datacenter: Zug 
INFO Defaulting to only available cluster: colo   
? Default Datastore datastore2
? Network VM Network
? Virtual IP Address for API 192.168.40.11
? Virtual IP Address for Ingress 192.168.40.10
? Base Domain mwlabs.net
? Cluster Name osc1
? Pull Secret [? for help] ******************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
INFO Obtaining RHCOS image file from 'https://rhcos-redirector.apps.art.xq1c.p1.openshiftapps.com/art/storage/releases/rhcos-4.10/410.84.202205191234-0/x86_64/rhcos-410.84.202205191234-0-vmware.x86_64.ova?sha256=' 
INFO Creating infrastructure resources...         
INFO Waiting up to 20m0s (until 7:24AM) for the Kubernetes API at https://api.osc1.mwlabs.net:6443... 
NFO API v1.23.5+3afdacb up                       
INFO Waiting up to 30m0s (until 7:37AM) for bootstrapping to complete... 
INFO Destroying the bootstrap resources...        
INFO Waiting up to 40m0s (until 8:02AM) for the cluster at https://api.osc1.mwlabs.net:6443 to initialize... 
W0620 07:22:56.773127 3585156 reflector.go:324] k8s.io/client-go/tools/watch/informerwatcher.go:146: failed to list *v1.ClusterVersion: Get "https://api.osc1.mwlabs.net:6443/apis/config.openshift.io/v1/clusterversions?fieldSelector=metadata.name%3Dversion&limit=500&resourceVersion=0": dial tcp 192.168.40.11:6443: connect: connection refused
E0620 07:22:56.773167 3585156 reflector.go:138] k8s.io/client-go/tools/watch/informerwatcher.go:146: Failed to watch *v1.ClusterVersion: failed to list *v1.ClusterVersion: Get "https://api.osc1.mwlabs.net:6443/apis/config.openshift.io/v1/clusterversions?fieldSelector=metadata.name%3Dversion&limit=500&resourceVersion=0": dial tcp 192.168.40.11:6443: connect: connection refused
W0620 07:22:57.882810 3585156 reflector.go:324] k8s.io/client-go/tools/watch/informerwatcher.go:146: failed to list *v1.ClusterVersion: Get "https://api.osc1.mwlabs.net:6443/apis/config.openshift.io/v1/clusterversions?fieldSelector=metadata.name%3Dversion&limit=500&resourceVersion=0": dial tcp 192.168.40.11:6443: connect: connection refused
E0620 07:22:57.882836 3585156 reflector.go:138] k8s.io/client-go/tools/watch/informerwatcher.go:146: Failed to watch *v1.ClusterVersion: failed to list *v1.ClusterVersion: Get "https://api.osc1.mwlabs.net:6443/apis/config.openshift.io/v1/clusterversions?fieldSelector=metadata.name%3Dversion&limit=500&resourceVersion=0": dial tcp 192.168.40.11:6443: connect: connection refused
W0620 07:22:59.979385 3585156 reflector.go:324] k8s.io/client-go/tools/watch/informerwatcher.go:146: failed to list *v1.ClusterVersion: Get "https://api.osc1.mwlabs.net:6443/apis/config.openshift.io/v1/clusterversions?fieldSelector=metadata.name%3Dversion&limit=500&resourceVersion=0": dial tcp 192.168.40.11:6443: connect: connection refused
E0620 07:22:59.979416 3585156 reflector.go:138] k8s.io/client-go/tools/watch/informerwatcher.go:146: Failed to watch *v1.ClusterVersion: failed to list *v1.ClusterVersion: Get "https://api.osc1.mwlabs.net:6443/apis/config.openshift.io/v1/clusterversions?fieldSelector=metadata.name%3Dversion&limit=500&resourceVersion=0": dial tcp 192.168.40.11:6443: connect: connection refused
W0620 07:23:03.868935 3585156 reflector.go:324] k8s.io/client-go/tools/watch/informerwatcher.go:146: failed to list *v1.ClusterVersion: Get "https://api.osc1.mwlabs.net:6443/apis/config.openshift.io/v1/clusterversions?fieldSelector=metadata.name%3Dversion&limit=500&resourceVersion=0": dial tcp 192.168.40.11:6443: connect: connection refused
E0620 07:23:03.868961 3585156 reflector.go:138] k8s.io/client-go/tools/watch/informerwatcher.go:146: Failed to watch *v1.ClusterVersion: failed to list *v1.ClusterVersion: Get "https://api.osc1.mwlabs.net:6443/apis/config.openshift.io/v1/clusterversions?fieldSelector=metadata.name%3Dversion&limit=500&resourceVersion=0": dial tcp 192.168.40.11:6443: connect: connection refused
INFO Waiting up to 10m0s (until 7:53AM) for the openshift-console route to be created... 
INFO Install complete!                            
INFO To access the cluster as the system:admin user when using 'oc', run 'export KUBECONFIG=/home/mwiget/openshift/install/osc1/auth/kubeconfig' 
INFO Access the OpenShift web-console here: https://console-openshift-console.apps.osc1.mwlabs.net 
INFO Login to the console with user: "kubeadmin", and password: "G7VgR-78gRY-RQIBY-D4b8c" 
INFO Time elapsed: 52m46s
```

This pulls ova image into ~/.cache/openshift-installer/image_cache:

```
[mwiget@rog1 openshift]$ ls -lart ~/.cache/openshift-installer/image_cache/
total 1040932
drwxr-xr-x. 3 mwiget mwiget         25 Jun 20 06:51 ..
-r--r--r--. 1 mwiget mwiget 1065912320 Jun 20 06:57 rhcos-410.84.202205191234-0-vmware.x86_64.ova
drwxr-xr-x. 2 mwiget mwiget         59 Jun 20 06:57 .
```


```
mwiget@rog1 osc1]$ export KUBECONFIG=/home/mwiget/openshift/install/osc1/auth/kubeconfig 
[mwiget@rog1 osc1]$ oc whoami
system:admin
[mwiget@rog1 osc1]$ oc status
In project default on server https://api.osc1.mwlabs.net:6443

svc/openshift - kubernetes.default.svc.cluster.local
svc/kubernetes - 172.30.0.1:443 -> 6443

View details with 'oc describe <resource>/<name>' or list resources with 'oc get all'.
[mwiget@rog1 osc1]$ 
```

## hugepages

https://docs.openshift.com/container-platform/4.10/scalability_and_performance/what-huge-pages-do-and-how-they-are-consumed-by-apps.html

```
$ oc create -f hugepages-tuned-boottime.yaml
tuned.tuned.openshift.io/hugepages created
```

```
[mwiget@falk1 openshift-cluster]$ kubectl get nodes
NAME                      STATUS                     ROLES    AGE     VERSION
osc1-w7ww6-master-0       Ready                      master   6h54m   v1.23.5+3afdacb
osc1-w7ww6-master-1       Ready                      master   6h54m   v1.23.5+3afdacb
osc1-w7ww6-master-2       Ready                      master   6h55m   v1.23.5+3afdacb
osc1-w7ww6-worker-gqlwx   Ready                      worker   6h34m   v1.23.5+3afdacb
osc1-w7ww6-worker-nlspc   Ready                      worker   6h34m   v1.23.5+3afdacb
osc1-w7ww6-worker-wvj8t   Ready,SchedulingDisabled   worker   6h34m   v1.23.5+3afdacb
[mwiget@falk1 openshift-cluster]$ kubectl describe node osc1-w7ww6-worker-nlspc  |grep 2Mi
  hugepages-2Mi:      800Mi
  hugepages-2Mi:      800Mi
  openshift-monitoring                    thanos-querier-7f44d7bcc5-mpvt6         15m (1%)      0 (0%)      92Mi (1%)        0 (0%)         5m14s
  hugepages-2Mi      0 (0%)        0 (0%)
[mwiget@falk1 openshift-cluster]$ kubectl describe node osc1-w7ww6-worker-wvj8t  |grep 2Mi
  hugepages-2Mi:      0
  hugepages-2Mi:      0
  hugepages-2Mi      0 (0%)        0 (0%)
[mwiget@falk1 openshift-cluster]$ kubectl describe node osc1-w7ww6-worker-gqlwx  |grep 2Mi
  hugepages-2Mi:      800Mi
  hugepages-2Mi:      800Mi
  openshift-monitoring                    openshift-state-metrics-65f58d4c67-z977h    3m (0%)       0 (0%)      72Mi (1%)        0 (0%)         2m28s
  openshift-monitoring                    thanos-querier-7f44d7bcc5-2gxkb             15m (1%)      0 (0%)      92Mi (1%)        0 (0%)         2m28s
  memory             3642Mi (60%)  0 (0%)
  hugepages-2Mi      0 (0%)        0 (0%)
```

