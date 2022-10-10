
resource "oci_monitoring_alarm" "OIT_DEV_COMPUTES_CPU_CRITICAL_12" {
  compartment_id        = var.compartment_id
  destinations          = [oci_ons_notification_topic.oci_topic.id]
  display_name          = "OIT_DEV_COMPUTES_CPU_CRITICAL_12"
  is_enabled            = true
  metric_compartment_id = var.compartment_id
  namespace             = "oci_computeagent"
  query                 = "CpuUtilization[5m].mean() > 85"
  severity              = "WARNING"

  body                             = "Critical - High CPU utilization reached"
  message_format                   = "ONS_OPTIMIZED"
  metric_compartment_id_in_subtree = false
  pending_duration                 = "PT5M"
  repeat_notification_duration     = "PT2H"
  resolution                       = "1m"

  suppression {
    time_suppress_from  = "2022-12-31T18:00:00.000Z"
    time_suppress_until = "2022-12-31T19:00:00.000Z"
    description = "Test alarms"
  }
}

resource "oci_monitoring_alarm" "OIT_DEV_COMPUTES_MEMORY_CRITICAL_12" {
  compartment_id        = var.compartment_id
  destinations          = [oci_ons_notification_topic.oci_topic.id]
  display_name          = "OIT_DEV_COMPUTES_MEMORY_CRITICAL_12"
  is_enabled            = true
  metric_compartment_id = var.compartment_id
  namespace             = "oci_computeagent"
  query                 = "MemoryUtilization[15m].mean() > 85"
  severity              = "CRITICAL"

  body                             = "Critical - High Memory utilization reached"
  message_format                   = "ONS_OPTIMIZED"
  metric_compartment_id_in_subtree = false
  pending_duration                 = "PT5M"
  repeat_notification_duration     = "PT2H"
  resolution                       = "1m"

  suppression {
    time_suppress_from  = "2029-02-01T18:00:00.000Z"
    time_suppress_until = "2029-02-01T19:00:00.000Z"
    description = "Test alarms"
  }
}
