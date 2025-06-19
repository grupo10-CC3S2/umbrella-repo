module "compute-repo" {
  source       = "../../../compute-repo"
  instance_count = 4
  name         = "server-1"
  network_name = module.network-repo.network_name_out
  depends_on = [ module.network-repo ]
}

module "network-repo" {
  source = "../../../network-repo"
  name   = "network-1"
  port   = 8080
}

module "storage-repo" {
  source       = "../../../storage-repo"
  name         = "db-1"
  server_name  = module.compute-repo.server_name_out
  network_name = module.compute-repo.network_name_out

  depends_on = [ module.network-repo, module.compute-repo ]
}
