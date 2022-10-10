resource "oci_ons_notification_topic" "oci_topic" {
  compartment_id = var.compartment_id
  name           = "test-topic22"
}
