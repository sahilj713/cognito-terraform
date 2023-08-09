resource "aws_cognito_user" "example" {
#   count = var.enable_create_user ? 1 : 0 
  for_each = var.names
   
  user_pool_id = aws_cognito_user_pool.user_pool.id
  username     = each.key

  attributes = {
    # terraform      = true
    # foo            = "bar"
    email          = each.value.email
    email_verified = true
  }
}