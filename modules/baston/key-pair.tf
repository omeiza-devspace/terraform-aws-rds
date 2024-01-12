
## Generate PEM (and OpenSSH) formatted private key.
resource "aws_key_pair" "this" {
  key_name   = "mykeypair"
  public_key = file(var.key_pair_file_path)
}