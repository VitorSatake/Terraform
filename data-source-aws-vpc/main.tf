terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }
  }

  backend "s3" {

    bucket = "satake-remote-state"
    key    = "aws-vpc-data-source/terraform.tfstate"
    region = "us-east-1"

  }


}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "vitor"     # nome do proprietario
      managed-by = "terraform" # dizendo para ser trabalhado por terraform e nao console
    }
  }
}
