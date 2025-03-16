# # main.tf
terraform {
  required_providers {
    statuscake = {
      source  = "StatusCakeDev/statuscake"
      version = "2.2.2"
    }
  }
}

provider "statuscake" {
  api_token = var.statuscake_api_token
}

resource "statuscake_contact_group" "monitoring_group" {
  name            = "PGR301 Monitoring Group"
  email_addresses = var.alert_emails
}

resource "statuscake_uptime_check" "website" {
  name           = var.website_name
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

  contact_groups = [statuscake_contact_group.monitoring_group.id]
  tags           = var.monitoring_tags
}

module "prod_monitoring" {
  source = "./modules/monitoring"

  contact_group_name = "Production Alerts"
  alert_emails       = ["tobbekrs@gmail.com"]
  name_prefix        = "prod"
  website_name       = "main-site"
  website_url        = "https://vg.no"
  monitoring_tags    = ["production", "main"]
}

module "dev_monitoring" {
  source = "./modules/monitoring"

  contact_group_name = "Development Alerts"
  alert_emails       = ["tobbekrs@gmail.com"]
  name_prefix        = "dev"
  website_name       = "dev-site"
  website_url        = "https://vg.no"
  check_interval     = 600
  monitoring_tags    = ["development"]
}