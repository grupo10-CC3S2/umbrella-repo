module "compute-repo" {
  # git::https://github.com/tu-usuario/terraform-modulos.git//vpc?ref=v1.0.0
  # ./compute-repo
  source       = "./compute-repo"
  name         = var.name
  network_name = var.network_name
}

module "network-repo" {
  source = "./network-repo"
  name   = var.name
  port   = 8080
}

module "storage-repo" {
  source       = "./storage-repo"
  name         = var.name
  server_name  = var.server_name
  network_name = var.network_name
}

resource "null_resource" "umbrella-repo" {
  provisioner "local-exec" {
    command = "echo 'Creando umbrella-repo con nombre ${var.name}'"
  }
}