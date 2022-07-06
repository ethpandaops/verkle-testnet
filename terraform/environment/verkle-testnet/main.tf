terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}


terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    endpoint                    = "https://fra1.digitaloceanspaces.com"
    region                      = "us-east-1"
    bucket                      = "verkle-testnets"
    key                         = "infrastructure/verkle-testnet/terraform.tfstate"
  }
}


locals {
  ssh_key_name = "parithosh"
  digital_ocean_project_name = "Verkle Testnets"
  size = "s-4vcpu-8gb-amd"
  region = "fra1"
  image = "ubuntu-20-04-x64"
  name = "verkle"
  vpc_name="verkle"
  vpc_ip_range="10.169.76.0/24"
  vpc_region = "fra1"
  shared_project_tags = [
                            "Owner:Parithosh",
                        ]

}

resource "digitalocean_vpc" "vpc" {
  name = local.vpc_name
  ip_range = local.vpc_ip_range
  region = local.vpc_region
}


module "verkle_bootnode" {
  droplet_count = 1

  size =  "s-4vcpu-8gb-amd"
  region = local.region
  image = local.image
  name = "verkle-bootnode"
  source = "../../modules/"

  tags = concat(local.shared_project_tags,["execution","eth1client_geth","explorer","bootnode","faucet", "landing_page","reverse_proxy","verkle-testnet"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
#  vpc_uuid = digitalocean_vpc.vpc.id
}

module "verkle-geth" {
  droplet_count = 5

  size =  "s-2vcpu-4gb-amd"
  region = local.region
  image = local.image
  name = "verkle-geth"
  source = "../../modules/"

  tags = concat(local.shared_project_tags,["execution","eth1client_geth","verkle-testnet"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "shadowfork-verkle" {
  droplet_count = 2

  size =  "s-4vcpu-8gb-amd"
  region = local.region
  image = local.image
  name = "shadowfork-sepolia-geth"
  source = "../../modules/"

  tags = concat(local.shared_project_tags,["execution","eth1client_geth_shadowfork","verkle-testnet"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}