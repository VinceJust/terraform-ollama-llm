# main.tf (Root)

####################
# 1) Docker-Network
####################
resource "docker_network" "ai_network" {
  name = var.network_name
}

##############################
# 2) Ollama (als eigenes Modul)
##############################
module "ollama" {
  source           = "./modules/ollama_service"
  container_name   = local.ollama_container
  model            = var.ollama_model
  port             = var.ollama_port
  network_name     = docker_network.ai_network.name
  enable_persistence = var.enable_persistence
  volume_name      = local.ollama_volume_name
}

#########################################
# 3) Open WebUI (abhängig von Ollama, als Modul)
#########################################
module "openwebui" {
  source            = "./modules/openwebui"
  container_name    = local.openwebui_container
  host_port         = var.webui_port
  network_name      = docker_network.ai_network.name
  ollama_host       = local.ollama_container
  ollama_port       = var.ollama_port
  ollama_dependency = module.ollama.container_id
}
