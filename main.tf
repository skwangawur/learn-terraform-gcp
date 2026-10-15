module "vpc_network" {
  source   = "./module/network"
  vpc_name = var.vpc_name
  subnets  = var.subnets
}

module "web_instance" {
  source = "./module/instance"

  name         = "web-instance"
  machine_type = "e2-micro"
  zone         = var.zone
  tags         = var.tags

  subnet_id              = module.vpc_network.subnet_ids["web_subnet"]
  service_account_email  = google_service_account.web_instance_sa.email
  service_account_scopes = var.service_account_scopes
}


module "allow_ssh_iap" {
  source        = "./module/firewall"
  firewall_name = "allow-ssh-iap"
  network       = module.vpc_network.vpc_id
  priority      = 1000
  direction     = "INGRESS"
  source_ranges = ["35.235.240.0/20"]
  protocol      = "tcp"
  ports         = ["22"]
  target_tags   = ["iap-ssh"]
}

module "allow_http" {
  source        = "./module/firewall"
  firewall_name = "allow-http"
  network       = module.vpc_network.vpc_id
  priority      = 1000
  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  protocol      = "tcp"
  ports         = ["80"]
  target_tags   = ["web-server"]
}


resource "google_service_account" "web_instance_sa" {
  account_id   = var.service_account_name
  display_name = "Web Instance Service Account"
}

module "web_bucket" {
  source                = "./module/bucket"
  bucket_name           = var.bucket_name
  bucket_location       = var.bucket_location
  bucket_storage_class  = var.bucket_storage_class
  bucket_role           = var.bucket_role
  service_account_email = google_service_account.web_instance_sa.email
}
