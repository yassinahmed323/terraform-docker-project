
variable "container_name" {
  description = "Name of the Docker web server"
  type        = string
  default     = "terraform-nginx-web"
}

variable "external_port" {
  description = "External port for the web server"
  type        = number
  default     = 8080
}
