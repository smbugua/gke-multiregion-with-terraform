resource "google_compute_subnetwork" "subnet_zone1" {
    name          = "subnet-zone1"
    ip_cidr_range = "${var.ip_cidr_range_sub1}"
    region        = "${var.primary_region}"
    network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_subnetwork" "subnet_zone2" {
    name          = "subnet-zone2"
    ip_cidr_range = "${var.ip_cidr_range_sub2}"
    region        = "${var.primary_region}"
    network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_subnetwork" "subnet_zone3" {
    name          = "subnet-zone3"
    ip_cidr_range = "${var.ip_cidr_range_sub3}"
    region        = "${var.primary_region}"
    network       = google_compute_network.vpc_network.self_link
}
