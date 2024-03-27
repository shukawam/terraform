variable "region" {
  default = "ap-tokyo-1"
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

variable "prefix" {

}

variable "opensearch_version" {
  default = "2.11.0"
}

variable "opensearch_master_username" {

}

variable "opensearch_master_user_password_hash" {
  default = "pbkdf2_stretch_1000$CNwrUogB3N5fKS+lXZuwRk0mMXvUbO3i$Qa9RzF3Wp70A37VDKzvNRvzfQxXL5COvZxZkyov46ew="
}

variable "gh_username" {
  default = "shukawam"
}
