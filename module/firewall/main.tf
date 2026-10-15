resource "google_compute_firewall" "this" {
  name      = var.firewall_name
  network   = var.network
  priority  = var.priority
  direction = var.direction

  source_ranges = var.source_ranges

  allow {
    protocol = var.protocol
    ports    = var.ports
  }

  target_tags = var.target_tags
}