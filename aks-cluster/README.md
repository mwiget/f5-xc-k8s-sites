
## References

- https://learn.hashicorp.com/tutorials/terraform/aks
- git clone https://github.com/hashicorp/learn-terraform-provision-aks-cluster
- https://learnk8s.io/terraform-aks


```
$ terragrunt apply

. . .

zurerm_kubernetes_cluster.default: Still creating... [2m20s elapsed]
azurerm_kubernetes_cluster.default: Still creating... [2m30s elapsed]
azurerm_kubernetes_cluster.default: Still creating... [2m40s elapsed]
azurerm_kubernetes_cluster.default: Still creating... [2m50s elapsed]
azurerm_kubernetes_cluster.default: Still creating... [3m0s elapsed]
azurerm_kubernetes_cluster.default: Still creating... [3m10s elapsed]
azurerm_kubernetes_cluster.default: Still creating... [3m20s elapsed]
azurerm_kubernetes_cluster.default: Still creating... [3m30s elapsed]
azurerm_kubernetes_cluster.default: Still creating... [3m40s elapsed]
azurerm_kubernetes_cluster.default: Still creating... [3m50s elapsed]
azurerm_kubernetes_cluster.default: Creation complete after 3m53s [id=/subscriptions/64b2d50d-296e-46e0-9e43-075f60ae4824/resourcegroups/useful-tick-rg/providers/Microsoft.ContainerService/managedClusters/useful-tick-aks]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

Outputs:

f5xc_site_token = "0042c3dc-bcf8-4d98-9b31-c62f966fc3dd"
kubernetes_cluster_name = "useful-tick-aks"
resource_group_name = "useful-tick-rg"
INFO[0262] Executing hook: kubeconfig                   
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  4724  100  4724    0     0  17288      0 --:--:-- --:--:-- --:--:-- 17304
WARNING: Merged "useful-tick-aks" as current context in /home/mwiget/.kube/config
NAME                              STATUS   ROLES    AGE   VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION     CONTAINER-RUNTIME
aks-default-38995051-vmss000000   Ready    <none>   37s   v1.21.9   10.240.0.4    <none>        Ubuntu 18.04.6 LTS   5.4.0-1073-azure   containerd://1.4.12+azure-3
aks-default-38995051-vmss000001   Ready    <none>   37s   v1.21.9   10.240.0.5    <none>        Ubuntu 18.04.6 LTS   5.4.0-1073-azure   containerd://1.4.12+azure-3
aks-default-38995051-vmss000002   Ready    <none>   34s   v1.21.9   10.240.0.6    <none>        Ubuntu 18.04.6 LTS   5.4.0-1073-azure   containerd://1.4.12+azure-3
namespace/ves-system created
serviceaccount/volterra-sa created
role.rbac.authorization.k8s.io/volterra-admin-role created
rolebinding.rbac.authorization.k8s.io/volterra-admin-role-binding created
daemonset.apps/volterra-ce-init created
serviceaccount/vpm-sa created
role.rbac.authorization.k8s.io/vpm-role created
rolebinding.rbac.authorization.k8s.io/vpm-role-binding created
clusterrolebinding.rbac.authorization.k8s.io/ver created
configmap/vpm-cfg created
statefulset.apps/vp-manager created
service/vpm created
```
