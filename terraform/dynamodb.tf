resource "aws_dynamodb_table" "user" {
  name           = "UserTable"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  attribute {
    name = "UserId"
    type = "S"
  }
}

resource "aws_dynamodb_table" "date_table" {
  name           = "DateTable"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "Date"
  attribute {
    name = "UserId"
    type = "S"
  }
  attribute {
    name = "Date"
    type = "S"
  }
}