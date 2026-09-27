terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      # version = "= 3.9.1"
      version = "~> 3.9.1"
      # version = ">= 3.9.1"
    }
  }

}