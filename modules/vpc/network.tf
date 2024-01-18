resource "google_compute_network" "vpc_network" {
    name                    = "usps-sandbox-${var.primary_region}-network"
    auto_create_subnetworks = false
}


