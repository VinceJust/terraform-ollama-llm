# locals.tf

locals {
  # 1) Basis-Prefix für Container-Namen
  ollama_container           = "${var.project_prefix}-ollama"
  openwebui_container        = "${var.project_prefix}-webui"

  # 2) Volume-Name nur, wenn Persistenz aktiv ist
  ollama_volume_name         = var.enable_persistence ? "${var.project_prefix}-models" : ""

  # (Frühere Werte für Grafana/Prometheus-Container löschen, da Observability raus ist)
  # grafana_container_name     = "${var.project_prefix}-grafana"
  # prometheus_container_name  = "${var.project_prefix}-prometheus"
}
