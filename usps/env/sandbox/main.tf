terraform {
  backend "remote"{
    hostname = "app.terraform.io"
    organization = "usps-sanbox"
    workspaces {
      name = "usps-sandbox"
    }
  }
    required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.12.0"
    }
    google-beta = {
        source = "hashicorp/google-beta" #some modules require google-beta
        version = "5.12.0"

    }    
  }

}
#Google provider
provider "google" {
    credentials = var.GCP_JSON_KEY
    project = var.gcp_project_id
    region = var.us_central_region
}
provider "google" {
    credentials = var.GCP_JSON_KEY
    project = var.gcp_project_id
    region = var.us_east_region
}
provider "google-beta" {
    credentials = var.GCP_JSON_KEY
    project = var.gcp_project_id
    region = var.us_central_region  
}
provider "google-beta" {
    credentials = var.GCP_JSON_KEY
    project = var.gcp_project_id
    region = var.us_east_region  
}
