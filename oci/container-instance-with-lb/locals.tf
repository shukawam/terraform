locals {
  ad = data.oci_identity_availability_domains.ads.availability_domains[0].name
}
