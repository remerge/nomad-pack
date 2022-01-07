variable "job_name" {
  type = string
  description = "Application name"
}

variable "task_image" {
  type = string
  description = "Docker image for job task"
}


variable "cluster" {
  type = string
  description = "Cluster name"
}

variable "environment" {
  type = string
  description = "Application environment"
}

variable "datacenter" {
  description = "Datacenter in the region which is eligible for task placement."
  type        = string
}

variable "http_port" {
  description = "Port for accessing application"
  type        = number
  default     = 0
}

variable "debug_port" {
  description = "Port for debugging application"
  type        = number
  default     = 0
}


variable "count" {
  description = "The number of app instances to deploy"
  type        = number
  default     = 1
}

variable "vault_policies" {
  description = "List of vault policies to use in the application"
  type        = list(string)
}

variable "vault_data" {
  description = "consul-template to retrieve secrets from vault"
  type        = string
  default = ""
}

variable "consul_data" {
  description = "consul-template to retrieve application configuration from consul"
  type        = string
  default = ""
}

variable "resources" {
  description = "The resource to assign to the application."
  type = object({
    cpu    = number
    memory = number
  })
  default = {
    cpu    = 500,
    memory = 256
  }
}
