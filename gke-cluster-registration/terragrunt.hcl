include "root" {
  path = find_in_parent_folders()
}

dependencies {
      paths = ["../gke-cluster"]
}

dependency "cluster" {
    config_path = "../gke-cluster"
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


