resource "aws_cognito_user_pool" "pool" {
  name = "mypool"
}

resource "aws_cognito_user" "user1" {
  user_pool_id = aws_cognito_user_pool.pool.id
  username     = "user1"
}