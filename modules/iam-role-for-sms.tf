# resource "aws_iam_role" "cognito_test_sms" {
#     name = "CognitoTest_SMS"
#     description           = "role for applicant cognito, send sms"
#     assume_role_policy    = jsonencode(
#         {
#             Statement = [
#                 {
#                     Condition = {
#                             StringEquals = {
#                                 "sts:ExternalId" = "${var.sms_role_ext_id}"
#                             }
#                         }
#                     Action    = "sts:AssumeRole"
#                     Effect    = "Allow"
#                     Principal = {
#                         Service = "cognito-idp.amazonaws.com"
#                     }
#                 },
#             ]
#             Version   = "2012-10-17"
#         }
#     )
#     inline_policy {
#         name   = "cognito_sms"
#         policy = jsonencode(
#             {
#                 Statement = [
#                     {
#                         Action   = [
#                             "sns:publish",
#                         ]
#                         Effect   = "Allow"
#                         Resource = [
#                             "*",
#                         ]
#                     },
#                 ]
#                 Version   = "2012-10-17"
#             }
#         )
#     }
# }  