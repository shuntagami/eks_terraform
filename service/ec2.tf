resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.keygen.public_key_openssh
}

resource "aws_instance" "sample" {
  ami                         = "ami-0df99b3a8349462c6"
  instance_type               = "t3.medium"
  monitoring                  = true
  subnet_id                   = data.terraform_remote_state.vpc.outputs.public_subnet_1_id
  key_name                    = aws_key_pair.key_pair.id
  user_data                   = file("./user_data.sh")
  associate_public_ip_address = true
  vpc_security_group_ids = [
    "${aws_security_group.instance.id}",
  ]
  root_block_device {
    volume_size = "30"
    volume_type = "gp2"
  }
  tags = {
    Name = "Minicube"
  }
}

output "aws_instance" {
  value = ["${aws_instance.sample.*.public_ip}"]
}
