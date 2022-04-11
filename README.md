# f5-xc-k8s-sites

Deploy F5 Distributed Cloud CEs in Azure AKS and Google GKE kubernetes clusters using Terragrunt/Terraform and 
the kubectl template https://gitlab.com/volterra.io/volterra-ce/-/tree/master/k8s

## Requirements

- Valid subscriptions for GKE and AKS and successfully authenticated via CLI.
- Terragrunt and Terraform installed

## Deploy

Adjust parameters in [terragrunt.hcl](terragrunt.hcl), then deploy via

```
$ terragrunt run-all apply
```

This will create AKS nad GKE clusters, download the ce_k8s.yml and adjust the 'CHANGE ME' paramters based on
the infos from the terragrunt.hcl and terraform output, creates kubeconfig and finally deploys the CE via kubectl.

Once deployed, go to the F5 XC Console and accept the pending registration requests. 

## Site Mesh

Optionally, one can deploy external lb in each site, then set the external LB IP address via F5XC Console to the site 
config, set a label in each site to make it part of a virtual site and select that virtual site in a site mesh group.

## Destroy

```
$ terragrunt run-all destroy
```



