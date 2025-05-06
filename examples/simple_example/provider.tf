provider "aws" {
  profile = var.profile
  region  = var.region
}

provider "random" {}