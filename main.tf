terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"  # Amplify requires us-east-1 for global resources
}

data "aws_route53_zone" "main" {
  name = "technokalal.com"
}

resource "aws_amplify_app" "app" {
  name       = "technokalal-app"
  repository = "https://github.com/kshivakumar2085/technokalal.com.git"

  platform = "WEB"

  # For static site, no build_spec needed
  build_spec = <<EOF
version: 1
frontend:
  phases:
    preBuild:
      commands:
        - echo "Nothing to build"
    build:
      commands:
        - echo "Static site, no build required"
  artifacts:
    baseDirectory: /
    files:
      - '**/*'
EOF

  # Enable auto branch creation
  enable_auto_branch_creation = false

  # Set environment variables if needed
  environment_variables = {
    "_LIVE_UPDATES" = "[]"
  }
}

resource "aws_amplify_branch" "main" {
  app_id      = aws_amplify_app.app.id
  branch_name = "main"
  framework   = "None"  # Static HTML
  stage       = "PRODUCTION"
}

resource "aws_amplify_domain_association" "domain" {
  app_id      = aws_amplify_app.app.id
  domain_name = "technokalal.com"

  sub_domain_settings {
    branch_name = aws_amplify_branch.main.branch_name
    prefix      = "www"
  }

  wait_for_verification = false
}
