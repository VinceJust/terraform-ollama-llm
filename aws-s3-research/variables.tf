variable "bucket_name" {
  type        = string
  description = "Ein global eindeutiger Name für den S3 Bucket"
}

variable "region" {
  type        = string
  description = "AWS Region, in der der Bucket erstellt wird"
  default     = "eu-central-1"
}

variable "profile" {
  type        = string
  description = "AWS CLI Profile Name für Authentifizierung"
  default     = "default"
}
