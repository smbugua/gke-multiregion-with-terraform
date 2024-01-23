resource "google_container_cluster" "my_cluster" {
    name               = "usps-autopilot-cluster"
    location           = "${var.primary_region}"
    network = "usps-sandbox-${var.primary_region}-network"
    subnetwork = "subnet-zone1"

    ip_allocation_policy {
        cluster_secondary_range_name = "pods"
        services_secondary_range_name = "services"
    }

    enable_autopilot = true
}
