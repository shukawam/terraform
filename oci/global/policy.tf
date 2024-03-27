resource "oci_identity_policy" "all_allowed_policy" {
  compartment_id = var.compartment_ocid
  description    = "all allowed policy"
  name           = format("%s-all-allowed-policy", var.prefix)
  statements = [
    "Allow group member-shuhei.kawamura to manage all-resources in compartment shuhei.kawamura",
    "Allow dynamic-group member-shuhei.kawamura_dynamic_group to manage all-resources in compartment shuhei.kawamura"
  ]
}

resource "oci_identity_policy" "service_policy" {
  compartment_id = var.compartment_ocid
  description    = "service policy"
  name           = format("%s-service-policy", var.prefix)
  statements = [
    "Allow service vulnerability-scanning-service to read repos in compartment shuhei.kawamura",
    "Allow service vulnerability-scanning-service to read compartments in compartment shuhei.kawamura",
    "Allow service dataintegration to use virtual-network-family in compartment shuhei.kawamura",
    "Allow service opensearch to manage vnics in compartment shuhei.kawamura",
    "Allow service opensearch to use subnets in compartment shuhei.kawamura",
    "Allow service opensearch to use network-security-groups in compartment shuhei.kawamura",
    "Allow service opensearch to manage vcns in compartment shuhei.kawamura",
    "Allow service datascience to use virtual-network-family in compartment shuhei.kawamura",
    "Allow service datascience to manage buckets in compartment shuhei.kawamura",
    "Allow service datascience to manage objects in compartment shuhei.kawamura",
    "Allow service ApiGateway to manage all-resources in compartment shuhei.kawamura",
    "Allow service OKE to manage all-resources in compartment shuhei.kawamura",
    "Allow service FaaS to use apm-domains in compartment shuhei.kawamura",
  ]
}
