# modules/ollama_service/main.tf

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.0"
    }
  }
}

##########
# 1) Docker-Volume für Modelle
##########
resource "docker_volume" "ollama_models" {
  count = var.enable_persistence ? 1 : 0
  name  = var.volume_name
}

##########
# 2) Ollama Image
##########
resource "docker_image" "ollama" {
  name = "ollama/ollama:latest"
}

##########
# 3) Ollama Container
##########
resource "docker_container" "ollama" {
  name  = var.container_name
  image = docker_image.ollama.image_id

  ports {
    internal = 11434
    external = var.port
  }

  # Netzwerkanbindung (falls benötigt)
  networks_advanced {
    name    = var.network_name
    aliases = [var.container_name]
  }

  # Wenn Persistenz aktiv, Volume als "mount" einbinden
  dynamic "mounts" {
    for_each = var.enable_persistence ? [docker_volume.ollama_models[0].name] : []
    content {
      source = mounts.value    # Name des Docker-Volumes, z.B. "ai-dev-models"
      target = "/root/.ollama" # Verzeichnis im Container
      type   = "volume"
    }
  }

  env = [
    "OLLAMA_MODELS=${var.model}"
  ]

  restart = "unless-stopped"
}

##########
# 4) Outputs
##########
output "container_name" {
  description = "Name des Ollama Containers"
  value       = docker_container.ollama.name
}

output "model_volume_name" {
  description = "Name des Docker-Volumes für Models (wenn angelegt)"
  value       = var.enable_persistence ? docker_volume.ollama_models[0].name : ""
}
