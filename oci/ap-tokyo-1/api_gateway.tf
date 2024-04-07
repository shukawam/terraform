resource "oci_apigateway_gateway" "api_gateway" {
  compartment_id = var.compartment_ocid
  endpoint_type  = "PUBLIC"
  subnet_id      = oci_core_subnet.public_subnet.id
  display_name   = format("%s-api-gateway", var.prefix)
  freeform_tags  = local.freeform_tags
}
