resource "google_cloud_ids_endpoint" "ids-endpoint" {
    name     = "ids-endpoint-${var.primary_region}"
    location = "${var.primary_region}-b"
    network  = data.google_compute_network.vpc_network.id
    severity = "INFORMATIONAL"
}
