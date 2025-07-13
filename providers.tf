terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }

  backend "s3" {
    bucket = "s3-versioning-public-or-private-policies"
    key    = "dev/terraforma.tfstate"
    region = "us-east-1"
  }

}

provider "aws" {
  region = "us-east-1"
}