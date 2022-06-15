include "root" {
  path = find_in_parent_folders()
}

dependencies {
    paths = ["../eks-cluster"]
}

dependency "cluster" {
    config_path = "../eks-cluster"
    mock_outputs = {
      cluster_name = "dummy"
    }
}

inputs = {
  cluster_name = dependency.cluster.outputs.cluster_name
}

terraform {

  before_hook "pre-check" {
    commands = ["apply","plan"]
    execute  = ["./pre-check.sh"]
  }

}


