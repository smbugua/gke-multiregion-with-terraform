data "google_compute_network" "vpc_network" {
    name = "usps-sandbox-${var.primary_region}-network"
}
