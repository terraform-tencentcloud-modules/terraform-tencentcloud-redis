terraform {
  required_version = "> 0.14.06"
  required_providers {
    tencentcloud = {
      source  = "tencentcloudstack/tencentcloud"
      version = ">=1.58.0"
    }
  }
}

provider "tencentcloud" {
  region = var.region
}
