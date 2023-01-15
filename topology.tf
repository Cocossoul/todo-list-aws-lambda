terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
}

resource "aws_amplify_app" "todo_list" {
  name       = "todo-list"
  repository = "https://github.com/Cocossoul/todo-list-aws-lambda"

  build_spec = file("amplify.yml")

  environment_variables = {
    AMPLIFY_MONOREPO_APP_ROOT = "www"
    AMPLIFY_DIFF_DEPLOY = "false"
  }
}

