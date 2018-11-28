resource "scaleway_server" "scw-abeef9" {
  name  = "scw-abeef9"
  image = "89ee4018-f8c3-4dc4-a6b5-bca14f985ebe"
  type  = "VC1S"
}

resource "scaleway_ip" "scw-abeef9" {
  server = "${scaleway_server.scw-abeef9.id}"
}

resource "scaleway_security_group" "scw-abeef9" {
  name                    = "Default security group"
  description             = "Auto generated security group."
  enable_default_security = false
}
