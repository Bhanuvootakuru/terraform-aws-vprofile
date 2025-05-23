variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-084568db4383264d4"
    us-east-2 = "ami-0945157a116cd5d12"
  }

}
variable "PRIV_KEY_PATH" {
  default = "vprofilekey"
}

variable "PUB_KEY_PATH" {
  default = "vprofilekey.pub"
}

variable "USERNAME" {
  default = "ubuntu"
}

variable "MYIP" {
  default = "152.57.157.50/32"
}

variable "rmquser" {
  default = "rabbit"
}
variable "rmqpass" {
  default = "Vutakuru@1234"
}

variable "dbpass" {
  default = "admin123"
}
variable "dbuser" {
  default = "admin"
}

variable "dbname" {
  default = "accounts"
}

variable "instance_count" {
  default = "1"
}
variable "VPC_NAME" {
  default = "vprofile-vpc"
}
variable "ZONE1" {
  default = "us-east-1a"
}
variable "ZONE2" {
  default = "us-east-1b"
}
variable "ZONE3" {
  default = "us-east-1c"
}

variable "VpcCIDR" {
  default = "172.21.0.0/16"
}

variable "PubSub1CIDR" {
  default = "172.21.1.0/24"
}

variable "PubSub2CIDR" {
  default = "172.21.2.0/24"
}

variable "PubSub3CIDR" {
  default = "172.21.3.0/24"
}

variable "PrivSub1CIDR" {
  default = "172.21.4.0/24"
}

variable "PrivSub2CIDR" {
  default = "172.21.5.0/24"
}
variable "PrivSub3CIDR" {
  default = "172.21.6.0/24"
}
