variable "user_pool_name" {
   type = string
   description = "name of the user-pool"
}

variable "alias_attributes" {
   type = list(any)
   description = "List of allowed attributes you can use to login instead of username"
   default = ["email", "phone_number"]
}

variable "auto_verified_attributes" {
  type = list(any)
  description = "List of allowed attributes you can use for verification"
  default = ["email"]
}

variable "default_email_option" {
   type = string
   description = ""
   default = "CONFIRM_WITH_CODE"
}

variable "email_subject" {
  type = string
  description = ""
  default = "Account Confirmation"
}

variable "email_message" {
  type = string
  description = ""
  default = "Your Confirmation code is {####}"
}

variable "enable_case_sensitive" {
  type = bool
  description = ""
  default = true
}

variable "password_min_length" {
  type = number
  description = ""
  default = 8
}

variable "password_require_lowercase" {
  type = bool
  description = ""
  default = true
}

variable "password_require_number" {
  type = bool
  description = ""
  default = true
}

variable "password_require_symbols" {
  type = bool
  description = ""
  default = true
}

variable "password_require_uppercase" {
  type = bool
  description = ""
  default = true
}

variable "temporary_password_validity_days" {
  type = number
  description = ""
  default = 7
}

variable "client_name"{
  type = string
  description = ""
} 

variable "generate_secret"{
  type = bool
  description = ""
  default = false
}

variable "refresh_token_validity" {
  type = number
  description = ""
  default = 90
}

variable "prevent_user_existence_errors" {
  type = string
  description = ""
  default = "ENABLED"
}

variable "supported_identity_providers" {
  type = list(any)
  description = "List of allowed identity providers you can use"
  default = ["COGNITO"]
}

variable "allowed_oauth_flows" {
  type = list(any)
  description = "List of allowed oauth flows you can use"
  default = ["code"]
}

variable "allowed_oauth_scopes" {
  type = list(any)
  description = "List of allowed oauth scopes you can use"
  default = ["email","phone","openid"]
}

variable "allowed_oauth_flows_user_pool_client" {
  type = bool
  description = "Whether the client is allowed to use the OAuth protocol when interacting with Cognito user pools."
  default = true
}

variable "callback_urls" {
  type = list(any)
  description = "List of allowed callback URLs for the identity providers."
  
}

variable "logout_urls" {
  type = list(any)
  description =" List of allowed logout URLs for the identity providers."
  
}

variable "explicit_auth_flows" {
  type = list(any)
  description = "List of authentication flows"
  default = [
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_ADMIN_USER_PASSWORD_AUTH"
  ]
}


variable "domain" {
  type = string
  description = "The domain string."
  
}

variable "css" {
  type = string
  description = "The CSS values in the UI customization, provided as a String."
  default = ".label-customizable {font-weight: 400;}"
}




variable "names" {
  
}

