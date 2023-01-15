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

variable "github_access_token" {
  type    = string
}

resource "aws_amplify_app" "todo_list" {
  name       = "todo-list"
  repository = "https://github.com/Cocossoul/todo-list-aws-lambda"

  access_token = var.github_access_token

  enable_branch_auto_build = true

  build_spec = file("amplify.yml")
  environment_variables = {
    AMPLIFY_MONOREPO_APP_ROOT = "www"
    AMPLIFY_DIFF_DEPLOY = "false"
  }
}

resource "aws_amplify_branch" "todo_list_prod" {
  app_id      = aws_amplify_app.todo_list.id
  branch_name = "main"
  stage     = "PRODUCTION"
}
