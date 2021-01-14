terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.3"
    }
  }
}

variable "DIGITALOCEAN_ACCESS_TOKEN" {}
variable "DIGITALOCEAN_DEFAULT_REGION" {
  default = "ams3"
}
variable "DIGITALOCEAN_SSH_KEY_ID" {}

provider "digitalocean" {
  token = var.DIGITALOCEAN_ACCESS_TOKEN
}

resource "digitalocean_droplet" "bastion" {
  image = "ubuntu-20-04-x64"
  name = "bastion"
  region = var.DIGITALOCEAN_DEFAULT_REGION
  size = "s-1vcpu-1gb"
  ssh_keys = [var.DIGITALOCEAN_SSH_KEY_ID]  # SSH key id
  user_data = templatefile("./scripts/user_data.sh", {})
  monitoring = true
  tags = [
    "bastion",
    "terraform",
    formatdate("MMM-DD-YYYY", timestamp())
  ]
}

output "bastion_ip" {
  value = digitalocean_droplet.bastion.ipv4_address
  description = "Bastion public IP"
}
