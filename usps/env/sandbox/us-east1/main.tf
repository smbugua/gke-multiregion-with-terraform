terraform {
  backend "remote"{
    hostname = "app.terraform.io"
    organization = "usps-sanbox"
    workspaces {
      name = "usps-sandbox-us-east1"
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
    alias = "us_east"
    credentials = var.GCP_JSON_KEY
    project = var.gcp_project_id
    region = var.primary_region
}
provider "google-beta" {
    alias = "us_east"
    credentials = var.GCP_JSON_KEY
    project = var.gcp_project_id
    region = var.primary_region  
}
