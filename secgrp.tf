terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}
resource "aws_security_group" "vprofile-bean-elb-sg" {
  name        = "vprofile-bean-elb-sg"
  description = "security group for bean-elb"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "vprofile_bastion_sg" {
  name        = "vprofile-bastion-sg"
  description = "security group for bastionisioner ec2 instance"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = [var.MYIP]
  }
}
resource "aws_security_group" "vprofile_prod_sg" {
  name        = "vprofile-prod-sg"
  description = "security group for beanstalk  instance"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 22
    protocol        = "tcp"
    to_port         = 22
    security_groups = [aws_security_group.vprofile_bastion_sg.id]
  }
}
resource "aws_security_group" "vprofile_backend_sg" {
  name        = "vprofile-backend-sg"
  description = "security group for RDS, active mq, elastic cache"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 0
    protocol        = "tcp"
    to_port         = 0
    security_groups = [aws_security_group.vprofile_prod_sg.id]
  }
}
resource "aws_security_group_rule" "sec_group_allow_itself" {
  from_port                = 0
  protocol                 = "tcp"
  security_group_id        = aws_security_group.vprofile_backend_sg.id
  to_port                  = 65535
  type                     = "ingress"
  source_security_group_id = aws_security_group.vprofile_backend_sg.id
}
