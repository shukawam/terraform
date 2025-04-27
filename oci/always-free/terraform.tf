provider "oci" {
  region       = var.region
  tenancy_ocid = var.tenancy_ocid
  user_ocid    = var.user_ocid
  fingerprint  = var.fingerprint
  private_key  = var.private_key
}

terraform {
  required_version = "~> 1.11.0"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 6.35.0"
    }
  }
  cloud {
    organization = "shukawam"
    workspaces {
      name = "always-free"
    }
  }
}
