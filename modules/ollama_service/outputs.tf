output "ollama_container_name" {
  value = var.container_name
}

output "container_id" {
  value = docker_container.ollama.id
}

