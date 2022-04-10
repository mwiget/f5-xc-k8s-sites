
## References

- https://learn.hashicorp.com/tutorials/terraform/aks
- git clone https://github.com/hashicorp/learn-terraform-provision-aks-cluster
- https://learnk8s.io/terraform-aks



```
azurerm_kubernetes_cluster.default: Still creating... [3m30s elapsed]
azurerm_kubernetes_cluster.default: Still creating... [3m40s elapsed]
azurerm_kubernetes_cluster.default: Still creating... [3m50s elapsed]
azurerm_kubernetes_cluster.default: Creation complete after 3m56s [id=/subscriptions/64b2d50d-296e-46e0-9e43-075f60ae4824/resourcegroups/sincere-cobra-rg/providers/Microsoft.ContainerService/managedClusters/sincere-cobra-aks]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

kubernetes_cluster_name = "sincere-cobra-aks"
resource_group_name = "sincere-cobra-rg"
INFO[0263] Executing hook: kubeconfig                   
Merged "sincere-cobra-aks" as current context in /home/mwiget/.kube/config
NAME                              STATUS   ROLES   AGE    VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION     CONTAINER-RUNTIME
aks-default-26660809-vmss000000   Ready    agent   3m7s   v1.21.9   10.240.0.4    <none>        Ubuntu 18.04.6 LTS   5.4.0-1073-azure   containerd://1.4.12+azure-3
```
