terraform {
  backend "s3" {
    bucket       = "cicdpipelinetestdepi"
    key          = "eks/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

