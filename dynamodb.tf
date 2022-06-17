resource "aws_dynamodb_table" "podcasts-table" {
  name           = "Podcasts"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "Title"

  attribute {
    name = "Title"
    type = "S"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }


  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}

resource "aws_dynamodb_table" "subscriptions-table" {
  name           = "Subscriptions"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "email"
  range_key = "UserId"

  attribute {
    name = "email"
    type = "S"
  }

  attribute {
    name = "UserId"
    type = "N"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }


  tags = {
    Name        = "dynamodb-table-2"
    Environment = "production"
  }
}