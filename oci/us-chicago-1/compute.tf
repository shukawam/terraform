resource "oci_core_instance" "bastion_instance" {
  availability_domain = local.ad
  compartment_id      = var.compartment_ocid
  source_details {
    source_id   = local.compute.ubuntu
    source_type = "image"
  }
  shape = local.compute.shape
  shape_config {
    ocpus         = 1
    memory_in_gbs = 16
  }
  display_name = format("%s-bastion-instance", var.prefix)
  create_vnic_details {
    assign_public_ip          = true
    assign_private_dns_record = false
    subnet_id                 = oci_core_subnet.public_subnet.id
  }
  metadata = {
    user_data = local.compute.cloud_init
  }
  freeform_tags = local.freeform_tags
}

resource "oci_core_instance" "database_instance" {
  availability_domain = local.ad
  compartment_id      = var.compartment_ocid
  source_details {
    source_id   = local.compute.ol
    source_type = "image"
    boot_volume_size_in_gbs = "100"
    boot_volume_vpus_per_gb = "10"
  }
  shape = local.compute.shape
  shape_config {
    ocpus         = 1
    memory_in_gbs = 16
  }
  display_name = format("%s-oracle-database", var.prefix)
  create_vnic_details {
    assign_public_ip          = true
    assign_private_dns_record = false
    subnet_id                 = oci_core_subnet.public_subnet.id
  }
  metadata = {
    authorized_keys = var.public_key
  }
  freeform_tags = local.freeform_tags
}
