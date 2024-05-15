terraform {
  required_version = ">= 1.6.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.28.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.1"
    }
  }

  backend "gcs" {
    bucket = "elegant-pipe-423001-f8"
    prefix = "terraform/state"
  }
}

provider "google" {
  region = "australia-southeast2"
}