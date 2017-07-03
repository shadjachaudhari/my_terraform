provider "aws" {
#provide access key,secret key and region
  access_key = ""
  secret_key = ""
  region     = ""
}

resource "aws_instance" "example" {
  depends_on = ["aws_security_group.allow_all"]
  ami           = "ami-3189ec51"
  instance_type = "t2.micro"
#provide subnet_id
  subnet_id = ""
  tags {
    Name = "TDDB-FTPOC-TF"
  }
  associate_public_ip_address = true
#provide key_name
  key_name = ""
  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
}

resource "aws_security_group" "allow_all" {
  name        = "TDDB-FTPOC-TF-securityGroup"
  description = "Allow all inbound traffic"
#provide vpc_id
  vpc_id = ""

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["10.0.0.0/16"]   
  }
}
