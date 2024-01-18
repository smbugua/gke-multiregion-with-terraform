resource "google_cloud_ids_endpoint" "example-endpoint" {
    name     = "ids-endpoint-${var.primary_region}"
    location = "${var.primary_region}-f"
    network  = data.google_compute_network.vpc_network.id
    severity = "INFORMATIONAL"
    depends_on = [data.google_service_networking_connection.private_service_connection]
}
