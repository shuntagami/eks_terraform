data "terraform_remote_state" "aws_iam" {
  backend = "s3"

  config = {
    bucket = "tfstate-shuntagami"
    key    = "Terraform_test/iam/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "tfstate-shuntagami"
    key    = "Terraform_test/vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

