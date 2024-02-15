
variable "broker_name" {
  description = "The name of the Amazon MQ broker."
  type        = string

}

variable "engine_version" {
  description = "The version of the ActiveMQ engine."
  type        = string

}

variable "host_instance_type" {
  description = "The instance type of the host."
  type        = string

}

variable "deployment_mode" {
  description = "The deployment mode of the broker."
  type        = string
}

variable "logs_general_enabled" {
  description = "Flag to enable general logs for the broker."
  type        = bool

}

variable "admin_username" {
  description = "The username for console access to the broker."
  type        = string

}

variable "admin_password" {
  description = "The password for console access to the broker."
  type        = string

}
variable "mq_configuration" {
  description = "The name of the Amazon MQ configuration."
  type        = string

}
