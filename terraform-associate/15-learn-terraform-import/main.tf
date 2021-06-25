# Configure docker provider
#
# https://www.terraform.io/docs/providers/docker/index.html
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.11"
    }
  }
required_version = "~> 1.0"
}

provider "docker" {
  host = "tcp://localhost:2375/"
}

resource "docker_container" "web" {
  name  = "hashicorp-learn"
  image = docker_image.nginx.latest

  env = []

  ports {
    external = 8080
    internal = 80
  }
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}
