terraform {
  backend "s3" {
    bucket = "terra-vprofile-state-project"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}