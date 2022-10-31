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
    key                         = "infrastructure/beverly-hills-testnet/terraform.tfstate"
  }
}


locals {
  ssh_key_name = "parithosh"
  digital_ocean_project_name = "Verkle Testnets"
  size = "s-4vcpu-8gb-amd"
  region = "fra1"
  image = "ubuntu-22-04-x64"
  name = "beverlyHills"
  vpc_name="beverlyHills"
  vpc_ip_range="10.169.77.0/24"
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

  size =  "s-8vcpu-16gb-amd"
  region = local.region
  image = local.image
  name = "verkle-bootnode"
  source = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lighthouse","execution","geth","explorer","bootnode","faucet", "ethstats_server","landing_page","reverse_proxy","beverly-hills-testnet"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
#  vpc_uuid = digitalocean_vpc.vpc.id
}

module "verkle-lighthouse-geth" {
  droplet_count = 2

  size =  "s-2vcpu-4gb-amd"
  region = local.region
  image = local.image
  name = "verkle-lighthouse-geth"
  source = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lighthouse","execution","geth","beverly-hills-testnet"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "verkle-teku-geth" {
  droplet_count = 1

  size =  "s-2vcpu-4gb-amd"
  region = local.region
  image = local.image
  name = "verkle-teku-geth"
  source = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","teku","execution","geth","beverly-hills-testnet"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "verkle-lodestar-geth" {
  droplet_count = 1

  size =  "s-2vcpu-4gb-amd"
  region = local.region
  image = local.image
  name = "verkle-lodestar-geth"
  source = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lodestar","execution","geth","beverly-hills-testnet"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}
