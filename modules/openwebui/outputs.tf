output "webui_container_name" {
  description = "Name of the deployed OpenWebUI container"
  value       = docker_container.webui.name
}

output "webui_host_port" {
  description = "Host port used to expose OpenWebUI"
  value       = var.host_port
}
