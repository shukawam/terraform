data "oci_core_services" "all_services" {
  filter {
    name   = "name"
    values = ["All.*"]
    regex  = true
  }
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ocid
}

data "oci_core_shapes" "shapes" {
  compartment_id = var.compartment_ocid
  filter {
    name   = "name"
    values = ["VM.Standard.E.*Flex"]
    regex  = true
  }
}

data "oci_core_images" "ubuntu_22_04" {
  compartment_id = var.compartment_ocid
  filter {
    name   = "display_name"
    values = ["Canonical-Ubuntu-22.04-2024.02.18-*"]
    regex  = true
  }
}

data "oci_objectstorage_namespace" "namespace" {
  compartment_id = var.compartment_ocid
}

data "template_file" "cloud_init" {
  template = file("./template/cloud-init.yaml")
  vars = {
    gh_username = var.gh_username
    password    = random_password.password.result
  }
}

data "template_cloudinit_config" "cloud_init_config" {
  base64_encode = true
  gzip          = true
  part {
    content      = data.template_file.cloud_init.rendered
    content_type = "text/cloud-config"
  }
}
