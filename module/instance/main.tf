resource "google_compute_instance" "this" {
  name                      = var.name
  machine_type              = var.machine_type
  zone                      = var.zone
  tags                      = var.tags
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  metadata_startup_script = file("${path.module}/../scripts/install-nginx.sh")

  network_interface {
    subnetwork = var.subnet_id

  }

  service_account {
    email  = var.service_account_email
    scopes = var.service_account_scopes
  }

}