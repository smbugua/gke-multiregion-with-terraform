resource "google_compute_global_address" "service_range" {
    name          = "peering-address-${var.primary_region}"
    purpose       = "VPC_PEERING"
    address_type  = "INTERNAL"
    prefix_length = 16
    network       = google_compute_network.vpc_network.id
}
