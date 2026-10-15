variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone"
  type        = string
  default     = "us-central1-a"
}

#variable instance


variable "tags" {
  description = "The tags for the instance"
  type        = list(string)
}


#variable network

variable "vpc_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "subnets" {
  description = "A map of subnets to create"
  type = map(object({
    subnet_name       = string
    subnet_cidr_range = string
    region            = string
  }))
}


variable "service_account_name" {
  description = "The name of the service account"
  type        = string
}


variable "service_account_scopes" {
  description = "The scopes for the service account"
  type        = list(string)
}

#variable bucket

variable "bucket_name" {
  description = "The name of the GCS bucket"
  type        = string
}

variable "bucket_location" {
  description = "The location of the GCS bucket"
  type        = string
}

variable "bucket_storage_class" {
  description = "The storage class of the GCS bucket"
  type        = string
}

variable "bucket_role" {
  description = "The IAM role for the GCS bucket"
  type        = string
}


#variable firewall


variable "priority" {
  description = "The priority of the firewall rule"
  type        = number
  default     = 1000
}

variable "direction" {
  description = "The direction of the firewall rule (INGRESS or EGRESS)"
  type        = string
  default     = "INGRESS"
}


variable "protocol" {
  description = "The protocol for the firewall rule"
  type        = string
  default     = "tcp"
}




