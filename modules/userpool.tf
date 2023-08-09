resource "aws_cognito_user_pool" "user_pool" {
  name = var.user_pool_name
  alias_attributes = var.alias_attributes

  username_configuration{
    case_sensitive = var.enable_case_sensitive
  }

  auto_verified_attributes = var.auto_verified_attributes

  password_policy {
    minimum_length                   = var.password_min_length
    require_lowercase                = var.password_require_lowercase
    require_numbers                  = var.password_require_number
    require_symbols                  = var.password_require_symbols
    require_uppercase                = var.password_require_uppercase
    temporary_password_validity_days = var.temporary_password_validity_days

  }

  verification_message_template {
    default_email_option = var.default_email_option
    email_subject = var.email_subject
    email_message = var.email_message
  }
 

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "email"
    required                 = true

    string_attribute_constraints {
      min_length = 1
      max_length = 256
    }
  }

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "phone_number"
    required                 = true

    }

  schema {
    name                    = "name"
    attribute_data_type     = "String"
    required                = true
    mutable                 = true

    string_attribute_constraints {
        min_length = 1
        max_length = 50
    }
  }
   
  
}









# https://stackoverflow.com/questions/49072662/where-to-find-external-id-for-smsconfiguration-in-cognito-user-pool#:~:text=I%20use%20create_user_pool%20for%20creating,automatically%20generated%20IAM%20SMS%2DRole.

# CognitoSMSRole:
#   Type: AWS::IAM::Role
#   Properties:
#     AssumeRolePolicyDocument: 
#       Version: "2012-10-17"
#       Statement: 
#         - Effect: "Allow"
#           Principal: 
#             Service: 
#               - "cognito-idp.amazonaws.com"
#           Action: 
#             - "sts:AssumeRole"
#           Condition:
#             StringEquals:
#               "sts:ExternalId": 'this-is-my-external-id'
#     Path: "/"
# CognitoSMSPolicy: 
#   Type: "AWS::IAM::Policy"
#   Properties: 
#     PolicyName: "CognitoSMSPolicy"
#     PolicyDocument: 
#       Version: "2012-10-17"
#       Statement: 
#         - Effect: "Allow"
#           Action: 
#             - "sns:publish"
#           Resource: 
#             - "*"
#     Roles: 
#       - Ref: CognitoSMSRole