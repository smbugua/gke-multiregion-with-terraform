resource "google_service_networking_connection" "private_service_connection" {
    network                 = google_compute_network.vpc_network.id
    service                 = "servicenetworking.googleapis.com"
    reserved_peering_ranges = [google_compute_global_address.service_range.name]
}
