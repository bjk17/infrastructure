data "scaleway_image" "ubuntu_1804" {
  architecture = "x86_64"
  name         = "Ubuntu Bionic"
}

resource "scaleway_server" "compute-node" {
  name  = "compute-node"
  image = "${data.scaleway_image.ubuntu_1804.id}"
  security_group = "${scaleway_security_group.scw-abeef9.id}"
  dynamic_ip_required = true
  type  = "X64-15GB"
  count = "1"  # 0 to destroy, 1 to create

  volume {
    size_in_gb = 150
    type       = "l_ssd"
  }
}

output "compute_node_public_ips" {
  value = "${scaleway_server.compute-node.*.public_ip}"
}

output "compute_node_private_ips" {
  value = "${scaleway_server.compute-node.*.private_ip}"
}
