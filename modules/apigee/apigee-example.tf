data "google_client_config" "current" {}

resource "google_compute_network" "apigee_network" {
  name       = "apigee-network"
}

resource "google_compute_global_address" "apigee_range" {
  name          = "apigee-range"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.apigee_network.id
}

resource "google_service_networking_connection" "apigee_vpc_connection" {
  network                 = google_compute_network.apigee_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.apigee_range.name]
}

resource "google_kms_key_ring" "apigee_keyring" {
  name     = "apigee-keyring"
  location = "us-central1"
}

resource "google_kms_crypto_key" "apigee_key" {
  name            = "apigee-key"
  key_ring        = google_kms_key_ring.apigee_keyring.id

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_project_service_identity" "apigee_sa" {
  provider = google-beta
  project  = "${var.gcp_project_id}"
  service  = google_project_service.apigee.service
}

resource "google_kms_crypto_key_iam_member" "apigee_sa_keyuser" {
  crypto_key_id = google_kms_crypto_key.apigee_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  member = "serviceAccount:${google_project_service_identity.apigee_sa.email}"
}

resource "google_apigee_organization" "org" {
  analytics_region                     = "${var.primary_region}"
  display_name                         = "apigee-org"
  description                          = "Terraform-provisioned Apigee Org."
  project_id                           = data.google_client_config.current.project
  authorized_network                   = google_compute_network.apigee_network.id
  runtime_database_encryption_key_name = google_kms_crypto_key.apigee_key.id

  depends_on = [
    google_service_networking_connection.apigee_vpc_connection,
    google_kms_crypto_key_iam_member.apigee_sa_keyuser,
  ]
}
