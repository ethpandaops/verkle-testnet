provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

variable "cloudflare_api_token" {
  type        = string
  sensitive   = true
  description = "Cloudflare API Token"
}

data "sops_file" "cloudflare" {
  source_file = "../../../secrets/cloudflare.enc.yaml"
}