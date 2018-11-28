provider "scaleway" {
  organization = "${var.organization}"
  token        = "${var.token}"
  region       = "ams1"
}

variable "organization" {}
variable "token" {}
