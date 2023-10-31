resource "tls_private_key" "openssh_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "terra_keypair" {
  key_name = var.key_name
  public_key = tls_private_key.openssh_key.public_key_openssh  #키가 생성되면 공백문자가 추가되므로 trimspace()를 사용
}

resource "local_file" "private_key_file" {
  content = tls_private_key.openssh_key.private_key_pem
  file_permission = 0400
  filename = "${var.key_name}.pem"
}