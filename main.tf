variable "name" {}
variable "role" {}
variable "ami" {}
variable "instance_type" {}
variable "key_name" {}
variable "key_path" {}
variable "public_ip" {}
variable "subnet" {}
variable "security_groups" {}
variable "num_nodes" {}
variable "stream_tag" {}

resource "aws_instance" "ec2" {

  instance_type = "${var.instance_type}"

  ami = "${var.ami}"
  subnet_id = "${var.subnet}"

  associate_public_ip_address = "${var.public_ip}"

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
    Name = "${var.name}-${count.index+1}"
    ServerRole = "${var.role}"
    Stream = "${var.stream_tag}"
    consul = "agent"
  }

}
