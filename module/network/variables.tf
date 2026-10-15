variable "vpc_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}


variable "subnets" {
  description = "A map of subnets to create"
  type = map(object({
    subnet_name       = string
    subnet_cidr_range = string
    region            = string
  }))
}
