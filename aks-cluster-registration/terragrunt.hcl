include "root" {
  path = find_in_parent_folders()
}

dependencies {
    paths = ["../aks-cluster"]
}

dependency "cluster" {
    config_path = "../aks-cluster"
    mock_outputs = {
      kubernetes_cluster_name = "dummy"
    }
}

inputs = {
  cluster_name = dependency.cluster.outputs.kubernetes_cluster_name
}

terraform {

  before_hook "pre-check" {
    commands = ["apply","plan"]
    execute  = ["./pre-check.sh"]
  }

}


