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
  check_interval     = 60
  monitoring_tags    = ["development"]
} 