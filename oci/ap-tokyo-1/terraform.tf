provider "oci" {
  region       = var.region
  tenancy_ocid = var.tenancy_ocid
  user_ocid    = var.user_ocid
  fingerprint  = var.fingerprint
  private_key  = var.private_key
}

terraform {
  required_version = "1.7.5"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "< 6.0.0"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "shukawam"
    workspaces {
      name = "ap-tokyo-1"
    }
  }
}
