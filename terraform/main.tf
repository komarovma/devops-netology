# main.tf

locals {
  web_instance_count_map = {
    stage = 1
    prod = 2
  }
  instances = {
  "t3.micro" = "${data.aws_ami.ubuntu.id}"
  "t3.medium" = "${data.aws_ami.ubuntu.id}"
}
}
provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_s3_bucket" "terraform_state" {

  bucket = var.bucket_name

  // This is only here so we can destroy the bucket as part of automated tests. You should not copy this for production
  // usage
  force_destroy = true

  # Enable versioning so we can see the full revision history of our
  # state files
  versioning {
    enabled = true
  }

  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

data "aws_ami" "ubuntu" {

    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-impish-21.10-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}

data "aws_caller_identity" "current" {}
resource "aws_instance" "app_server" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = terraform.workspace == "default" ? "t2.medium" : "t2.micro"
  count = local.web_instance_count_map[terraform.workspace]
    tags = {
    Name = var.instance_name
  }
}

resource "aws_instance" "app_server_for" {
  for_each = local.instances 
      ami = each.value
      instance_type = each.key
      tags = {
      Name = var.instance_name
      }
}
