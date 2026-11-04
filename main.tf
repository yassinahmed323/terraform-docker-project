
# Pull the Nginx Docker image
resource "docker_image" "nginx" {
  name         = "nginx:stable"
  keep_locally = false
}

# Create a Docker network
resource "docker_network" "web_network" {
  name = "terraform-web-network"
}

# Create the Nginx web server container
resource "docker_container" "web_server" {
  name  = var.container_name
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.external_port
  }

  networks_advanced {
    name = docker_network.web_network.name
  }
}
