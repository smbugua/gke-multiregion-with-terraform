data "google_service_networking_connection" "private_service_connection" {
    network = data.google_compute_network.vpc_network.id
    service = "servicenetworking.googleapis.com"
}
data "google_compute_network" "vpc_network" {
    name = "usps-sandbox-${var.primary_region}-network"
}
