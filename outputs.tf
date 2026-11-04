
output "web_server_url" {
  description = "URL to access the Nginx server"
  value       = "http://localhost:${var.external_port}"
}

output "container_name" {
  description = "Docker container name"
  value       = docker_container.web_server.name
}

output "network_name" {
  description = "Docker network name"
  value       = docker_network.web_network.name
}


output "external_port" {
  description = "External port used to access the Nginx web server"
  value       = var.external_port
}
