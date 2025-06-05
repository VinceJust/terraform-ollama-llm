variable "container_name" {
  description = "Name des Ollama-Containers"
  type        = string
}

variable "model" {
  description = "Ollama-Modell, das geladen werden soll (z.B. gemma:2b)"
  type        = string
}

variable "port" {
  description = "Port, auf dem der Ollama-Container lauscht"
  type        = number
  default     = 11434
}

variable "network_name" {
  description = "Name des Docker-Netzwerks, in dem der Ollama-Container läuft"
  type        = string
}

variable "enable_persistence" {
  description = "Wenn true, wird ein Docker-Volume für Ollama-Modelle angelegt und gemountet"
  type        = bool
  default     = false
}

variable "volume_name" {
  description = "Name des Docker-Volumes, um Modell-Dateien persistent zu speichern"
  type        = string
  default     = "" # Wird nur ausgewertet, wenn enable_persistence=true
}
