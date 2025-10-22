# ----------------------------
# Key Pair for EC2
# ----------------------------

resource "aws_key_pair" "devops_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}
