output "private_key" {
  value = tls_private_key.openssh_key.private_key_openssh
  description = "생성된 private key 정보"
}

output "public_key" {
  value = tls_private_key.openssh_key.public_key_openssh
  description = "생성된 public key 정보"
}

output "key_name" {
  value = aws_key_pair.terra_keypair.key_name
}