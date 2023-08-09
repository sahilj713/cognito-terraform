resource "aws_cognito_user_pool_domain" "cognito-domain" {
  domain       = var.domain
  user_pool_id = "${aws_cognito_user_pool.user_pool.id}"
}


resource "aws_cognito_user_pool_ui_customization" "example" {
  client_id = aws_cognito_user_pool_client.client.id

  css        = var.css
  user_pool_id = aws_cognito_user_pool_domain.cognito-domain.user_pool_id
}
