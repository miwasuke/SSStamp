terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.26.0"
    }
  }

     backend "s3" {
     bucket = "miwasuke-tfstate"
     key    = "ssstamp/terraform.tfstate"
     region = "ap-northeast-1"
   }
}