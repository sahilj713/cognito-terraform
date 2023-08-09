user_pools = {
  userpool1 = {
    user_pool_name                       = "xyz"
    alias_attributes                     = ["email", "phone_number"]
    auto_verified_attributes             = ["email"]
    default_email_option                 = "CONFIRM_WITH_CODE"
    email_subject                        = "Account Confirmation"
    email_message                        = "Your Confirmation code is {####}"
    enable_case_sensitive                = true
    password_min_length                  = 8
    password_require_lowercase           = true
    password_require_number              = true
    password_require_symbols             = true
    password_require_uppercase           = true
    temporary_password_validity_days     = 7
    client_name                          = "xyz-client"
    generate_secret                      = false
    refresh_token_validity               = 90
    prevent_user_existence_errors        = "ENABLED"
    supported_identity_providers         = ["COGNITO"]
    allowed_oauth_flows                  = ["code"]
    allowed_oauth_scopes                 = ["email", "phone", "openid"]
    allowed_oauth_flows_user_pool_client = true
    callback_urls                        = ["https://www.google.com"]
    logout_urls                          = ["https://www.google.com"]
    explicit_auth_flows = [
      "ALLOW_REFRESH_TOKEN_AUTH",
      "ALLOW_USER_PASSWORD_AUTH",
      "ALLOW_ADMIN_USER_PASSWORD_AUTH"
    ]
    domain = "adiparsh"
    css    = ".label-customizable {font-weight: 400;}"
    enable_create_user = true
    names = {
      example = {
        email = "noreply@gmail.com"
      }
      example1 = {
        email = "yesreply@gmail.com"
      }
      example1 = {
        email = "yesreply@gmail.com"
      }
      sparsh = {
        email = "sparshbaurasi848@gmail.com"
      }
    }
  }
}