module "compute-repo" {
  source       = "git::https://github.com/grupo10-CC3S2/compute-repo.git"
  instance_count = 4
  name         = "server-1"
  network_name = module.network-repo.network_name_out
  depends_on = [ module.network-repo ]
}

module "network-repo" {
  source = "git::https://github.com/grupo10-CC3S2/network-repo.git"
  name   = "network-1"
  port   = 8080
}

module "storage-repo" {
  source       = "git::https://github.com/grupo10-CC3S2/storage-repo.git"
  name         = "db-1"
  server_name  = module.compute-repo.server_name_out
  network_name = module.compute-repo.network_name_out

  depends_on = [ module.network-repo, module.compute-repo ]
}
