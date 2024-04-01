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

variable "opensearch_version" {
  default = "2.11.0"
}

variable "opensearch_master_username" {

}

variable "opensearch_master_user_password_hash" {
  default = "pbkdf2_stretch_1000$ZiyvY/PfAWhIGom4H6zq2H8wC6/S0nVX$rU7/uHuxLHzP3PSSr0GjvcnnuNLZbMn/E/RGw73JAKM="
  description = "default value: wellcome"
}

variable "gh_username" {
  default = "shukawam"
}

variable "public_key" {
  
}
