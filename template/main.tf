resource "aws_apigatewayv2_api" "restAPI-gw" {
  provider = aws.eu-central-1

  protocol_type = "HTTP"
  name          = "restAPI--gw"

  tags = {
    env      = "development"
    archUUID = "1d36075c-54dd-4bf7-a797-c19d1ff008a3"
  }
}

resource "aws_lambda_function" "restAPI-lambda-ext" {
  provider = aws.eu-central-1

  runtime       = "nodejs12.x"
  function_name = "restAPI-function-ext"

  tags = {
    env      = "development"
    archUUID = "1d36075c-54dd-4bf7-a797-c19d1ff008a3"
  }
}

resource "aws_subnet" "restAPI-subnet" {
  provider = aws.eu-central-1

  vpc_id     = aws_vpc.restAPI-vpc.id
  cidr_block = "10.0.2.0/24"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    env      = "development"
    archUUID = "1d36075c-54dd-4bf7-a797-c19d1ff008a3"
  }
}

resource "aws_docdb_cluster" "restAPI-documentdb" {
  provider = aws.eu-central-1


  tags = {
    env      = "development"
    archUUID = "1d36075c-54dd-4bf7-a797-c19d1ff008a3"
  }
}

resource "aws_secretsmanager_secret" "restAPI-db-creds" {
  provider = aws.eu-central-1


  tags = {
    env      = "development"
    archUUID = "1d36075c-54dd-4bf7-a797-c19d1ff008a3"
  }
}

resource "aws_vpc" "restAPI-vpc" {
  provider = aws.eu-central-1

  enable_dns_support = true
  enable_classiclink = true
  cidr_block         = "10.0.0.0/16"

  tags = {
    env      = "development"
    archUUID = "1d36075c-54dd-4bf7-a797-c19d1ff008a3"
  }
}

resource "aws_lambda_function" "restAPI-lambda" {
  provider = aws.eu-central-1

  runtime       = "nodejs12.x"
  function_name = "restAPI-function"

  tags = {
    env      = "development"
    archUUID = "1d36075c-54dd-4bf7-a797-c19d1ff008a3"
  }
}

