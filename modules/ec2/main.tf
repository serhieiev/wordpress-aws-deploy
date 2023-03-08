# Get the latest Ubuntu AMI ID
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh_key"
  public_key = file(var.ssh_pub_key_file)
}

# Create AWS EIP Association as a top level resource
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.instance.id
  allocation_id = var.allocation_id
}

# Create an EC2 Instance
resource "aws_instance" "instance" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.ssh_key.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = "WP-instance"
  }
}
