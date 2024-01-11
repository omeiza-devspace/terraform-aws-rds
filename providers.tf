provider "aws" {
  region                   = var.region
  profile                  = var.profile
  shared_credentials_files = ["~/.aws/credentials"]

  default_tags {
    tags = {
      Environment = "${var.env}"
      Project     = "${var.project}"
      ManagedBy   = "terraform"
    }
  }
}

