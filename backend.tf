terraform {
  backend "s3" {
    bucket = "terraform-ollama-state-vin"
    key    = "state/ollama-project.tfstate"
    region = "eu-central-1"
  }
}
