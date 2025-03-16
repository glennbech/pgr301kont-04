#variables.tf
variable "statuscake_api_token" {
  description = "StatusCake API Token"
  type        = string
  sensitive   = true
}


variable "website_name" {
  description = "Name of the website to monitor"
  type        = string
}

variable "website_url" {
  description = "URL of the website to monitor"
  type        = string
}

variable "check_interval" {
  description = "Interval between checks in seconds"
  type        = number
  default     = 300 # 5 minutes
}

variable "confirmation_count" {
  description = "Number of confirmations before alert"
  type        = number
  default     = 2
}

variable "trigger_rate" {
  description = "Rate of triggers"
  type        = number
  default     = 0
}

variable "timeout" {
  description = "Timeout for HTTP checks in seconds"
  type        = number
  default     = 30
}

variable "status_codes" {
  description = "List of status codes to consider as successful"
  type        = list(string)
  default     = ["200", "201", "301", "302"]
}

variable "monitoring_tags" {
  description = "Tags for the monitoring check"
  type        = list(string)
  default     = ["production"]
}