terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.0"
    }
  }
}


resource "docker_image" "webui" {
  name = var.image_name
}

resource "docker_container" "webui" {
  name  = var.container_name
  image = docker_image.webui.image_id

  ports {
    internal = 8080
    external = var.host_port
  }

  env = [
    "OLLAMA_API_BASE_URL=http://${var.ollama_host}:${var.ollama_port}"
  ]

  networks_advanced {
    name    = var.network_name
    aliases = ["webui"]
  }

  depends_on = [var.ollama_dependency]
}
