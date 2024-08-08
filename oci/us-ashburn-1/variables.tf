variable "region" {
  default = "us-chicago-1"
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

variable "gh_username" {
  default = "shukawam"
}

variable "public_key" {
  
}
