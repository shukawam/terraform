provider "auth0" {
  domain        = var.domain
  client_id     = var.client_id
  client_secret = var.client_secret
  debug         = false
}

terraform {
  required_version = "1.9.5"
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "1.12.0"
    }
  }
  cloud {
    organization = "shukawam"
    workspaces {
      name = "auth0"
    }
  }
}
