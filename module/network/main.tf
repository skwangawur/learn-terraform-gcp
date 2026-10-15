resource "google_compute_network" "this" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "this" {

  for_each = var.subnets

  name          = each.value.subnet_name
  ip_cidr_range = each.value.subnet_cidr_range
  network       = google_compute_network.this.id
  region        = each.value.region
}