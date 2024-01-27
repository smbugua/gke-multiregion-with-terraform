resource "google_container_cluster" "my_cluster" {
    name               = "autopilot-cluster"
    location           = "${var.primary_region}"
    network = "sandbox-${var.primary_region}-network"
    subnetwork = "subnet-zone1"
    initial_node_count = 1

    enable_autopilot = true
}
