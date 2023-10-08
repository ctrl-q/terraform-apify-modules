resource "restapi_object" "this" {
  path = "/webhooks"

  data = jsonencode({
    for key, value in {
      isAdHoc    = var.is_adhoc
      actionType = var.action_type
      eventTypes = var.event_types
      condition = {
        actorTaskId = var.condition.actor_task_id
      }
      googleDrive              = var.google_drive
      isApifyIntegration       = var.is_apify_integration
      idempotencyKey           = var.idempotency_key
      ignoreSslErrors          = var.ignore_ssl_errors
      doNotRetry               = var.do_not_retry
      requestUrl               = var.request_url
      payloadTemplate          = var.payload_template
      headersTemplate          = var.headers_template
      description              = var.description
      shouldInterpolateStrings = var.should_interpolate_strings
    } : key => value if value != null
  })
}

output "id" {
  value = restapi_object.this.id
}
