#modules/monitoring/main.tf
terraform {
  required_providers {
    statuscake = {
      source  = "StatusCakeDev/statuscake"
      version = "2.2.2"
    }
  }
}

resource "statuscake_contact_group" "alert_group" {
  name            = var.contact_group_name
  email_addresses = var.alert_emails
}

resource "statuscake_uptime_check" "monitoring" {
  name           = "${var.name_prefix}-${var.website_name}"
  check_interval = var.check_interval
  confirmation   = var.confirmation_count
  trigger_rate   = var.trigger_rate

  http_check {
    timeout          = var.timeout
    validate_ssl     = true
    follow_redirects = true
    status_codes     = var.status_codes
    request_method   = "HTTP"
  }

  monitored_resource {
    address = var.website_url
  }

  contact_groups = [statuscake_contact_group.alert_group.id]
  tags           = var.monitoring_tags
}