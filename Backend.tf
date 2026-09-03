terraform {
  required_version = "1.16.0"

  cloud {
    
    organization = "Cloudconstijoe"

    workspaces {
      name = "aks-workspace"
    }
  }
}