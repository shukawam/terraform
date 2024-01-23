locals {
  ad    = data.oci_identity_availability_domains.ads.availability_domains[0].name
  image = data.oci_core_images.images.images[0].id
}

resource "oci_core_instance" "shukawam_instance" {
  availability_domain = local.ad
  compartment_id      = var.compartment_ocid
  source_details {
    source_id   = local.image
    source_type = "image"
  }
  shape = "VM.Standard.E4.Flex"
  shape_config {
    ocpus         = 1
    memory_in_gbs = 16
  }
  display_name = "shukawam-instance"
  create_vnic_details {
    assign_public_ip          = true
    assign_private_dns_record = false
    subnet_id                 = oci_core_subnet.shukawam_public_subnet.id
  }
  metadata = {
    user_data = templatefile("./template/cloud-init.yaml", {
        gh_username = "shukawam"
        password = "ChangeMe!!"
    })
  }
}
