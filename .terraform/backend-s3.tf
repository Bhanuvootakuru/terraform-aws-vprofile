terraform {
  backend "s3" {
    bucket = "terra-vprofile-state"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}