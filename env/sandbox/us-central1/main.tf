terraform {
  backend "remote"{
    hostname = "app.terraform.io"
    organization = "<terraform-org-name>"
    workspaces {
      name = "sandbox-us-central1"
    }
  }
    required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.5.0"
    }
    google-beta = {
        source = "hashicorp/google-beta" #some modules require google-beta
        version = "5.5.0"

    }    
  }

}
#Google provider
provider "google" {
    credentials = var.GCP_JSON_KEY
    project = var.gcp_project_id
    region = var.primary_region
}

provider "google-beta" {
    credentials = var.GCP_JSON_KEY
    project = var.gcp_project_id
    region = var.primary_region  
}

#activate the modules
# module "gcp-vpc" {
#     source = "../../../modules/vpc"
#     gcp_project_id = var.gcp_project_id
#     primary_region = var.primary_region
#     ip_cidr_range = var.ip_cidr_range
#     ip_cidr_range_sub1 = var.ip_cidr_range_sub1
#     ip_cidr_range_sub2 = var.ip_cidr_range_sub2
#     ip_cidr_range_sub3 = var.ip_cidr_range_sub3
# }
# # module "gcp-ids" {
# #     source = "../../../modules/ids"
# #     gcp_project_id = var.gcp_project_id
# #     primary_region = var.primary_region
# # }
# module "gcp-gke" {
#     source = "../../../modules/gke"
#     gcp_project_id = var.gcp_project_id
#     primary_region = var.primary_region
# }
