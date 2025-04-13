resource "oci_vault_secret" "mushop_oci_registry_user" {
  compartment_id = var.compartment_ocid
  key_id = "ocid1.key.oc1.ap-tokyo-1.efsf34s4aabno.abxhiljrtoafq5k335wdq47uhrdmczhlyw6jatnbjjr6u7y7mv65bi6o35sa"
  secret_name = "OCI_REGISTRY_USERNAME"
  vault_id = "ocid1.vault.oc1.ap-tokyo-1.efsf34s4aabno.abxhiljrmv3p6wslkhhauyju34ncqfslnfby2nthho7l4z5l3cuegsjhspaa"
  secret_content {
    content_type = "BASE64"
    content = base64encode("oracleidentitycloudservice/orasejapan/shuhei.kawamura@oracle.com")
  }
}
