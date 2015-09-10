output "consul server private ips a" {
  value = "${module.consul_servers_a.private-ips}"
}

output "consul server private ips b" {
  value = "${module.consul_servers_b.private-ips}"
}

