include "root" {
  path = find_in_parent_folders()
}

dependencies {
      paths = ["../openshift-cluster"]
}

dependency "cluster" {
    config_path = "../openshift-cluster"
    mock_outputs = {
      kubernetes_cluster_name = "dummy"
    }
}

inputs = {
  cluster_name = "osc1"
}

terraform {

  before_hook "pre-check" {
    commands = ["apply","plan"]
    execute  = ["./pre-check.sh"]
  }

}


