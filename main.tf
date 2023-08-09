module "cognito" {
  source                               = "./modules"
  for_each                             = var.user_pools
  user_pool_name                       = each.value.user_pool_name
  alias_attributes                     = each.value.alias_attributes
  auto_verified_attributes             = each.value.auto_verified_attributes
  default_email_option                 = each.value.default_email_option
  email_subject                        = each.value.email_subject
  email_message                        = each.value.email_message
  enable_case_sensitive                = each.value.enable_case_sensitive
  password_min_length                  = each.value.password_min_length
  password_require_lowercase           = each.value.password_require_lowercase
  password_require_number              = each.value.password_require_number
  password_require_symbols             = each.value.password_require_symbols
  password_require_uppercase           = each.value.password_require_uppercase
  temporary_password_validity_days     = each.value.temporary_password_validity_days
  client_name                          = each.value.client_name
  generate_secret                      = each.value.generate_secret
  refresh_token_validity               = each.value.refresh_token_validity
  prevent_user_existence_errors        = each.value.prevent_user_existence_errors
  supported_identity_providers         = each.value.supported_identity_providers
  allowed_oauth_flows                  = each.value.allowed_oauth_flows
  allowed_oauth_scopes                 = each.value.allowed_oauth_scopes
  allowed_oauth_flows_user_pool_client = each.value.allowed_oauth_flows_user_pool_client
  callback_urls                        = each.value.callback_urls
  logout_urls                          = each.value.logout_urls
  explicit_auth_flows                  = each.value.explicit_auth_flows
  domain                               = each.value.domain
  css                                  = each.value.css
  # enable_create_user                   = each.value.enable_create_user
  names                                = each.value.names

}

# module "cognito" {
#   source                               = "./modules"
#   # for_each                             = var.user_pools
#   user_pool_name                       = "xyz"
#     alias_attributes                     = ["email", "phone_number"]
#     auto_verified_attributes             = ["email"]
#     default_email_option                 = "CONFIRM_WITH_CODE"
#     email_subject                        = "Account Confirmation"
#     email_message                        = "Your Confirmation code is {####}"
#     enable_case_sensitive                = true
#     password_min_length                  = 8
#     password_require_lowercase           = true
#     password_require_number              = true
#     password_require_symbols             = true
#     password_require_uppercase           = true
#     temporary_password_validity_days     = 7
#     client_name                          = "xyz-client"
#     generate_secret                      = false
#     refresh_token_validity               = 90
#     prevent_user_existence_errors        = "ENABLED"
#     supported_identity_providers         = ["COGNITO"]
#     allowed_oauth_flows                  = ["code"]
#     allowed_oauth_scopes                 = ["email", "phone", "openid"]
#     allowed_oauth_flows_user_pool_client = true
#     callback_urls                        = ["https://www.google.com"]
#     logout_urls                          = ["https://www.google.com"]
#     explicit_auth_flows = [
#       "ALLOW_REFRESH_TOKEN_AUTH",
#       "ALLOW_USER_PASSWORD_AUTH",
#       "ALLOW_ADMIN_USER_PASSWORD_AUTH"
#     ]
#     domain = "adiparsh"
#     css    = ".label-customizable {font-weight: 400;}"
# }