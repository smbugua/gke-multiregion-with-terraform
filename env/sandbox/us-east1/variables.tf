variable "gcp_project_id" {
    description = "GCP Project ID"
    type = string
}
variable "primary_region" {
    description = "Primary region for GCP resources"
    type = string
}
variable "GCP_JSON_KEY" {
    description = "GCP JSON Key"
    type = string
}
variable "ip_cidr_range" {
    description = "IP CIDR Range"
    type = string
    default = "10.10.0.0/24"
}

variable "ip_cidr_range_sub1" {
    type = string
    default = "10.10.1.0/24"
}
variable "ip_cidr_range_sub2" {
    type = string
    default = "10.10.2.0/24"
}
variable "ip_cidr_range_sub3" {
    type = string
    default = "10.10.3.0/24"
}
