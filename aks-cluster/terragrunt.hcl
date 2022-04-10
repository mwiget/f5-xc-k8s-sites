include "root" {
  path = find_in_parent_folders()
}

terraform {
  after_hook "kubeconfig" {
    commands = ["apply"]
      execute  = ["./create_kubeconfig.sh"]
  }
}
