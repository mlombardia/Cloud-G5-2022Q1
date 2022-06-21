resource "aws_cognito_user_pool" "pool" {
  name = "mypool"
}

resource "aws_cognito_user" "user1" {
  user_pool_id = aws_cognito_user_pool.pool.id
  username     = "user1"
}


resource "aws_cognito_user_group" "main" {
  name         = "user-group"
  user_pool_id = aws_cognito_user_pool.pool.id
}

resource "aws_cognito_user_group" "user2" {
  name         = "user2-group"
  user_pool_id = aws_cognito_user_pool.pool.id
}


resource "aws_cognito_identity_pool" "main" {
  identity_pool_name               = "identity pool"
  allow_unauthenticated_identities = false
  allow_classic_flow               = false
}