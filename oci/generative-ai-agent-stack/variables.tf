variable "region" {
  default = "uk-london-1"
}

variable "tenancy_ocid" {
  sensitive   = true
  description = "Tenant OCID"
}

variable "user_ocid" {
  sensitive   = true
  description = "User OCID"
}

variable "fingerprint" {
  sensitive   = true
  description = "Fingerprint"
}

variable "private_key" {
  sensitive   = true
  description = "Private Key"
}

variable "compartment_ocid" {
  sensitive   = true
  description = "Compartment OCID"
}

variable "opensearch_master_username" {
  sensitive   = true
  description = "Username for OpenSearch master user"
}

variable "opensearch_master_user_password_hash" {
  sensitive   = true
  description = "Password hash for OpenSearch master user's password hash"
}
