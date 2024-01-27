data "google_compute_network" "vpc_network" {
    name = "sandbox-${var.primary_region}-network"
}
