provider "aws" {
  region  = "${var.region}"
  profile = "testing"
}

resource "aws_instance" "example" {
  ami = "ami-57eae033"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.developer.id}"
}

resource "aws_key_pair" "developer" {
  key_name = "deployer_key"
  public_key = "${var.public_key}"
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}
