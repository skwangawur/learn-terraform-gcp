variable "bucket_name" {
  description = "The name of the GCS bucket"
  type        = string
}

variable "bucket_location" {
  description = "The location of the GCS bucket"
  type        = string
  default     = "US"
}

variable "bucket_storage_class" {
  description = "The storage class of the GCS bucket"
  type        = string
  default     = "STANDARD"
}

variable "bucket_role" {
  description = "The IAM role for the GCS bucket"
  type        = string
  default     = "roles/storage.objectViewer"
}

variable "service_account_email" {
  description = "The email of the service account"
  type        = string
}