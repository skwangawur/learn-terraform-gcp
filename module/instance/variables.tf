variable "zone" {
  description = "The GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "name" {
  description = "The name of the instance"
  type        = string
}

variable "machine_type" {
  description = "The machine type for the instance"
  type        = string
  default     = "e2-micro"
}

variable "tags" {
  description = "The tags for the instance"
  type        = list(string)
}

variable "subnet_id" {
  description = "The ID of the subnet to attach the instance to"
  type        = string
}



variable "service_account_email" {
  description = "The email of the service account"
  type        = string
}

variable "service_account_scopes" {
  description = "The scopes for the service account"
  type        = list(string)
}