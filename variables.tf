### MANDATORY ###

variable "name" {
  description = "Name of the ec2 instance, defaults to <EC2>"
  default = "EC2"
}

variable "environment" {
  description = "Name of environment the instance is running in"
  default = "DEV"
}

variable "role_tag" {
  description = "Role of the ec2 instance, defaults to <SERVICE>"
  default = "SERVICE"
}

variable "environment_tag" {
  description = "Role of the ec2 instance, defaults to <DEV>"
  default = "DEV"
}

variable "costcenter_tag" {
  description = "Role of the ec2 instance, defaults to <DEV>"
  default = "DEV"
}

# group our resources
variable "stream_tag" {
  description = "Role of the ec2 instance, defaults to <DEFAULT>"
  default = "DEFAULT"
}

###################################################################
# AWS configuration below
###################################################################
variable "key_name" {
  description = "Name of the SSH keypair to use in AWS."
  default = "ec2"
}

### MANDATORY ###
variable "key_path" {
  description = "Path to the private portion of the SSH key specified."
}

variable "public_ip" {
  description = "Associate a public ip"
  default = false
}

###################################################################
# ec2 configuration below
###################################################################

variable "ami" {
  default = {
    ap-southeast-2 = "ami-8997ecb3"
  }
}

variable "iam_role" {
  default = ""
}

variable "instance_type" {
  default = "t2.micro"
}

# number of nodes in zone a
variable "num_nodes" {
  description = "number of nodes"
  default = "1"
}

