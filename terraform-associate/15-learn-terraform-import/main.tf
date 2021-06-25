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
  image = "sha256:4f380adfc10f4cd34f775ae57a17d2835385efd5251d6dfe0f246b0018fb0399"

  env = []

  ports {
    external = 8080
    internal = 80
  }
}