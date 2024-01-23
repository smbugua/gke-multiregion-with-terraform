resource "google_container_cluster" "my_cluster" {
    name               = "usps-autopilot-cluster"
    location           = "${var.primary_region}"
    remove_default_node_pool = true

    node_pool {
        name               = "main-node-pool"
        initial_node_count = 1
        autoscaling {
            min_node_count = 1
            max_node_count = 10
        }
        management {
            auto_repair  = true
            auto_upgrade = true
        }
        node_config {
            machine_type = "e2-medium"
            disk_size_gb = 100
            oauth_scopes = [
                "https://www.googleapis.com/auth/compute",
                "https://www.googleapis.com/auth/devstorage.read_only",
                "https://www.googleapis.com/auth/logging.write",
                "https://www.googleapis.com/auth/monitoring",
            ]
        }
    }

    addons_config {
        network_policy_config {
            disabled = true
        }
    }

    ip_allocation_policy {
        cluster_secondary_range_name = "pods"
        services_secondary_range_name = "services"
    }

    enable_autopilot = true
}
