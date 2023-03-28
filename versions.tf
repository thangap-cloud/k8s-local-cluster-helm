terraform {
  required_version = "~> 1.3.0"

  required_providers {
    kubernetes  = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.10.0"
    }

    helm        = {
      source    = "hashicorp/helm"
      version   = "~> 2.2.0"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }

  }
}