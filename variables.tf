# variables.tf

# 1. Prefix für alle Container- und Volume-Namen
variable "project_prefix" {
  description = "Präfix für alle Container- und Volumen-Namen (z.B. 'ai-dev')"
  type        = string
  default     = "ai-dev"
}

# 2. Ollama-Modell und Port
variable "ollama_model" {
  description = "Name des Ollama-Modells, das geladen werden soll (z. B. 'gemma:2b')"
  type        = string
  default     = "gemma:2b"
}

variable "ollama_port" {
  description = "Port, auf dem der Ollama-Container lauscht"
  type        = number
  default     = 11434
}

# 3. WebUI-Port
variable "webui_port" {
  description = "Port, auf dem Open WebUI von außen erreichbar ist"
  type        = number
  default     = 8080
}

# 4. Docker-Netzwerk-Name
variable "network_name" {
  description = "Name des Docker-Netzwerks, in dem Container zusammenlaufen"
  type        = string
  default     = "ai-network"
}

# 5. Persistenz aktivieren (Volume) für Ollama-Modelle
variable "enable_persistence" {
  description = "Wenn true, wird ein Docker-Volume für Ollama-Modelle angelegt und gemountet"
  type        = bool
  default     = true
}
