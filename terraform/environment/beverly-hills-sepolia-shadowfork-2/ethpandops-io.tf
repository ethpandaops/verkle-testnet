resource "cloudflare_record" "dns-entry" {
  for_each = {
    for vm in local.digitalocean_vms : "${vm.id}" => vm
  }
  zone_id = data.sops_file.cloudflare.data["zones.ethpandaops-io.zone_id"]
  name    = "${each.value.name}.${data.sops_file.cloudflare.data["zones.ethpandaops-io.domain"]}"
  type    = "A"
  value   = "${digitalocean_droplet.main[each.value.id].ipv4_address}"
  proxied = false
}

resource "cloudflare_record" "dns-entry-bootnode" {
  zone_id = data.sops_file.cloudflare.data["zones.ethpandaops-io.zone_id"]
  name    = "beverly-hills-shadowfork-2.${data.sops_file.cloudflare.data["zones.ethpandaops-io.domain"]}"
  type    = "A"
  value   = "${digitalocean_droplet.main["teku-geth.bootnode"].ipv4_address}"
  proxied = false
}

resource "cloudflare_record" "dns-entry-bootnode-wildcard" {
  zone_id = data.sops_file.cloudflare.data["zones.ethpandaops-io.zone_id"]
  name    = "*.beverly-hills-shadowfork-2"
  type    = "CNAME"
  value   = "beverly-hills-shadowfork-2.${data.sops_file.cloudflare.data["zones.ethpandaops-io.domain"]}"
  proxied = false
}