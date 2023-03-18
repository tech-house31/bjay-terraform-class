# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket    = "your_bucket_name"
    key       = "bolji_web-ecs.tfstate"
    region    = "us-east-1"
    profile   = "terraform-user"
  }
}