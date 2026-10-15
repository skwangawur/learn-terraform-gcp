resource "google_storage_bucket" "this" {
  name                        = var.bucket_name
  location                    = var.bucket_location
  storage_class               = var.bucket_storage_class
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_member" "this" {
  bucket = google_storage_bucket.this.name
  role   = var.bucket_role
  member = "serviceAccount:${var.service_account_email}"
}