terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2" # Asia Pacific (Seoul) region
}

variable "aws_region" {
  description = "AWS Region"
  default     = "ap-northeast-2"
}



variable "project_name" {
  description = "Project name for resource tagging"
  default     = "seungilove"
}

variable "db_username" {
  description = "Database master username"
  default     = "admin"
  sensitive   = true
}

variable "db_password" {
  description = "Database master password"
  sensitive   = true
}