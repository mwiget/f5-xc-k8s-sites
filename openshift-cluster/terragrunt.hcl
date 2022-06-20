include "root" {
  path = find_in_parent_folders()
}

terraform {
  after_hook "kubeconfig" {
    commands = ["apply"]
      execute  = ["./create_site.sh"]
  }
#  before_hook "remove ce" {
#    commands = ["destroy"]
#    execute  = ["./delete_site.sh"]
#  }
}
