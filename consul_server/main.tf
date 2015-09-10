variable "name" {}
variable "ami" {}
variable "instance_type" {}
variable "key_path" {}
variable "region" {}
variable "subnet" {}
variable "security_groups" {}
variable "key_name" {}
variable "key_path" {}
variable "num_nodes" {}
variable "stream_tag" {}

resource "aws_instance" "consul" {

  instance_type = "${var.instance_type}"

  ami = "${var.ami}"
  subnet_id = "${var.subnet}"

  # This may be temporary
  associate_public_ip_address = "false"

  # Our Security groups
  security_groups = ["${split(",", replace(var.security_groups, "/,\s?$/", ""))}"]
  key_name = "${var.key_name}"

  # consul nodes in subnet
  count = "${var.num_nodes}"

  connection {
    user = "ubuntu"
    type = "ssh"
    host = "${self.private_ip}"
    # The path to your keyfile
    key_file = "${var.key_path}"
  }

  tags {
    Name = "consul_server_node-${var.name}-${count.index+1}"
    stream = "${var.stream_tag}"
    consul = "server"
  }

}
