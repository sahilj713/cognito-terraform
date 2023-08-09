resource "aws_cognito_user_pool_client" "client" {
  name = var.client_name

  user_pool_id = aws_cognito_user_pool.user_pool.id
  generate_secret = var.generate_secret
  refresh_token_validity = var.refresh_token_validity
  prevent_user_existence_errors = var.prevent_user_existence_errors
  supported_identity_providers = var.supported_identity_providers
  allowed_oauth_flows          = var.allowed_oauth_flows
  allowed_oauth_scopes = var.allowed_oauth_scopes
  allowed_oauth_flows_user_pool_client = var.allowed_oauth_flows_user_pool_client
  callback_urls                        = var.callback_urls
  logout_urls = var.logout_urls
  explicit_auth_flows = var.explicit_auth_flows
  
}