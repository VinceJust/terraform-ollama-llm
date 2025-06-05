variable "image_name" {
  description = "Image name for OpenWebUI"
  type        = string
  default     = "ghcr.io/open-webui/open-webui:main"
}

variable "container_name" {
  description = "Name of the OpenWebUI container"
  type        = string
  default     = "open-webui"
}

variable "host_port" {
  description = "Port on host for OpenWebUI"
  type        = number
  default     = 8080
}

variable "ollama_host" {
  description = "Hostname of the Ollama container (reachable from within Docker network)"
  type        = string
  default     = "ollama"
}

variable "ollama_port" {
  description = "Port of the Ollama API"
  type        = number
  default     = 11434
}

variable "network_name" {
  description = "Docker network name"
  type        = string
}

variable "ollama_dependency" {
  description = "Dependency placeholder (typically the Ollama container)"
  type        = any
}
