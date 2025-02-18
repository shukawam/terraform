variable "domain" {
  description = "Domain name of Auth0"
}

variable "client_id" {
  description = "Client ID of Auth0"
  sensitive   = true
}

variable "client_secret" {
  description = "Client Secret of Auth0"
  sensitive   = true
}
