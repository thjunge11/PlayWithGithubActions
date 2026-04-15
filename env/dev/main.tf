terraform {
  backend "s3" {
    bucket         = "terraform-with-actions-bucket-520397876818-eu-central-1-an"
    key            = "env/dev/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-with-actions-locks-1234"
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-central-1"
}

module "app_bucket" {
  source           = "../../modules/s3_bucket"
  bucket_name      = "myapp-${terraform.workspace}-bucket-520397876818-thjunge11"
  enable_versioning = false
  tags = {
    env = terraform.workspace
  }
}
