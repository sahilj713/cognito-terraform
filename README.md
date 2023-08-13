<h1 align="center"> terraform-aws-cognito-user-pool </h1> <br>

<p>Terraform module to create Amazon Cognito User Pools, configure its attributes and resources such as <b>app clients, domain, resource servers.</b> Amazon Cognito User Pools provide a secure user directory that scales to hundreds of millions of users. As a fully managed service, User Pools are easy to set up without any worries about standing up server infrastructure.</p>

## Usage

You can use this module to create a Cognito User Pool using the default values or use the detailed definition to set every aspect of the Cognito User Pool like app clients, domain, resource servers resources.

## Cognito User Pool

- [**`name`**](#var-user_pool_name): *(**Required** `string`)*<a name="var-name"></a>

  The name of the user pool. Forces new resource.

- [**`alias_attributes`**](#var-alias_attributes): *(Optional `set(string)`)*<a name="var-alias_attributes"></a>

  Attributes supported as an alias for this user pool. Possible values: `phone_number`, `email`, or `preferred_username`. Conflicts with `username_attributes`. Default applies if `username_attributes` is not set.

- [**`enable_username_case_sensitivity`**](#var-enable_case_sensitivity): *(Optional `bool`)*<a name="var-enable_username_case_sensitivity"></a>

  Specifies whether username case sensitivity will be applied to all users in the user pool through Cognito APIs.

  Default is `false`.  

- [**`auto_verified_attributes`**](#var-auto_verified_attributes): *(Optional `set(string)`)*<a name="var-auto_verified_attributes"></a>

  The attributes to be auto-verified. Possible values: `email`, `phone_number`.

  Default is `["email"]`.

- [**`default_email_option`**](#var-default_email_option): *(Optional `string`)*<a name="var-default_email_option"></a>

  The default email option. Must be either `CONFIRM_WITH_CODE` or `CONFIRM_WITH_LINK`.

  Default is `"CONFIRM_WITH_CODE"`.

- [**`email_subject`**](#var-email_subject): *(Optional `string`)*<a name="var-email_subject"></a>

  The subject line for the email message template.

  Default is `"Your Verification Code"`.

- [**`email_message`**](#var-email_message): *(Optional `string`)*<a name="var-email_message"></a>

  The email message template. Must contain the `{####}` placeholder.

  Default is `"Your verification code is {####}."`.

- [**`password_minimum_length`**](#var-password_minimum_length): *(Optional `number`)*<a name="var-password_minimum_length"></a>

  The minimum length of the password policy that you have set.

  Default is `20`.

- [**`password_require_lowercase`**](#var-password_require_lowercase): *(Optional `bool`)*<a name="var-password_require_lowercase"></a>

  Whether you have required users to use at least one lowercase letter in their password.

  Default is `true`.

- [**`password_require_numbers`**](#var-password_require_number): *(Optional `bool`)*<a name="var-password_require_numbers"></a>

  Whether you have required users to use at least one number in their password.

  Default is `true`.

- [**`password_require_symbols`**](#var-password_require_symbols): *(Optional `bool`)*<a name="var-password_require_symbols"></a>

  Whether you have required users to use at least one symbol in their password.

  Default is `true`.

- [**`password_require_uppercase`**](#var-password_require_uppercase): *(Optional `bool`)*<a name="var-password_require_uppercase"></a>

  Whether you have required users to use at least one uppercase letter in their password.

  Default is `true`.

- [**`temporary_password_validity_days`**](#var-temporary_password_validity_days): *(Optional `number`)*<a name="var-temporary_password_validity_days"></a>

  In the password policy you have set, refers to the number of days a temporary password is valid. If the user does not sign in during this time, their password will need to be reset by an administrator.

  Default is `1`. 



## Cognito User Pool Domain

- [**`domain`**](#var-domain): *(Optional `string`)*<a name="var-domain"></a>

  The domain name that should be used. Can be set to a FQDN or prefix.
  If no FQDN and `certificate_arn` are set, the domain prefix will be used for the sign-up and sign-in pages that are hosted by Amazon Cognito,
  e.g. `https://{YOUR_PREFIX}.auth.eu-west-1.amazoncognito.com`.
  The prefix must be unique across the selected AWS Region.
  Domain names can only contain lower-case letters, numbers, and hyphens.

- [**`certificate_arn`**](#var-certificate_arn): *(Optional `string`)*<a name="var-certificate_arn"></a>

  The ARN of an ISSUED ACM certificate in us-east-1 for a custom domain.


## Cognito User Pool Resource Servers  

- [**`resource_servers`**](#var-resource_servers): *(Optional `list(resource_server)`)*<a name="var-resource_servers"></a>

  A list of objects with resource server declarations.

  Default is `[]`.

  Example:

  ```hcl
  resource_servers = [
    {
      identifier = "https://api.resourceserver.com"
      name       = "API"
      scopes     = [
        {
          scope_name = "users:read"
          scope_description = "Read user data"
        },
        {
          scope_name = "users:write"
          scope_description = "Write user data"
        }
      ]
    }
  ]
  ```

  Each `resource_server` object in the list accepts the following attributes:

  - [**`identifier`**](#attr-resource_servers-identifier): *(**Required** `string`)*<a name="attr-resource_servers-identifier"></a>

    An identifier for the resource server.

  - [**`name`**](#attr-resource_servers-name): *(**Required** `string`)*<a name="attr-resource_servers-name"></a>

    A name for the resource server.

  - [**`scope`**](#attr-resource_servers-scope): *(Optional `list(scope)`)*<a name="attr-resource_servers-scope"></a>

    A list of Authorization Scope.

    Each `scope` object in the list accepts the following attributes:

    - [**`scope_name`**](#attr-resource_servers-scope-scope_name): *(**Required** `string`)*<a name="attr-resource_servers-scope-scope_name"></a>

      The scope name.

    - [**`scope_description`**](#attr-resource_servers-scope-scope_description): *(**Required** `string`)*<a name="attr-resource_servers-scope-scope_description"></a>

      The scope description.


## Cognito User Pool Clients

- [**`clients`**](#var-app_clients): *(Optional `map{client}`)*<a name="var-clients"></a>

  A map of objects with the clients definitions.

  Example:

  ```hcl
  clients = {
    name = {
        allowed_oauth_scopes                 = ["presto-brightree-service-prod/order.write", "presto-brightree-service-prod/status.write"]
        generate_secret                      = true
        refresh_token_validity               = 30
        prevent_user_existence_errors        = "ENABLED"
        allowed_oauth_flows                  = ["client_credentials"]
        allowed_oauth_flows_user_pool_client = true
        explicit_auth_flows = [
          "ALLOW_REFRESH_TOKEN_AUTH",
          "ALLOW_USER_SRP_AUTH",
          "ALLOW_CUSTOM_AUTH"
        ]
      }
  }
  ```

Each `client` object in the map accepts the following attributes:

 - [**`name`**](#attr-clients-name): *(**Required** `string`)*<a name="attr-clients-name"></a>

    Name of the application client.

  - [**`allowed_oauth_flows_user_pool_client`**](#attr-clients-allowed_oauth_flows_user_pool_client): *(Optional `bool`)*<a name="attr-clients-allowed_oauth_flows_user_pool_client"></a>

    Whether the client is allowed to follow the OAuth protocol when interacting with Cognito user pools.

  - [**`allowed_oauth_flows`**](#attr-clients-allowed_oauth_flows): *(Optional `set(string)`)*<a name="attr-clients-allowed_oauth_flows"></a>

    List of allowed OAuth flows (code, implicit, client_credentials).

  - [**`allowed_oauth_scopes`**](#attr-clients-allowed_oauth_scopes): *(Optional `set(string)`)*<a name="attr-clients-allowed_oauth_scopes"></a>

    List of allowed OAuth scopes (phone, email, openid, profile, and aws.cognito.signin.user.admin).

   - [**`explicit_auth_flows`**](#attr-clients-explicit_auth_flows): *(Optional `set(string)`)*<a name="attr-clients-explicit_auth_flows"></a>

    List of authentication flows (ADMIN_NO_SRP_AUTH, CUSTOM_AUTH_FLOW_ONLY, USER_PASSWORD_AUTH, ALLOW_ADMIN_USER_PASSWORD_AUTH, ALLOW_CUSTOM_AUTH, ALLOW_USER_PASSWORD_AUTH, ALLOW_USER_SRP_AUTH, ALLOW_REFRESH_TOKEN_AUTH).

  - [**`generate_secret`**](#attr-clients-generate_secret): *(Optional `bool`)*<a name="attr-clients-generate_secret"></a>

    Should an application secret be generated.

  - [**`prevent_user_existence_errors`**](#attr-clients-prevent_user_existence_errors): *(Optional `string`)*<a name="attr-clients-prevent_user_existence_errors"></a>

    Choose which errors and responses are returned by Cognito APIs during authentication, account confirmation, and password recovery when the user does not exist in the user pool. When set to ENABLED and the user does not exist, authentication returns an error indicating either the username or password was incorrect, and account confirmation and password recovery return a response indicating a code was sent to a simulated destination. When set to LEGACY, those APIs will return a UserNotFoundException exception if the user does not exist in the user pool.

    - [**`refresh_token_validity`**](#attr-clients-refresh_token_validity): *(Optional `number`)*<a name="attr-clients-refresh_token_validity"></a>

    Time limit in days refresh tokens are valid for. 



#### Example of terraform.tfvars

```hcl
user_pools = {
  userpool1 = {
    user_pool_name                   = "test-pool"
    alias_attributes                 = ["email", "phone_number"]
    auto_verified_attributes         = ["email"]
    default_email_option             = "CONFIRM_WITH_CODE"
    email_subject                    = "Account Confirmation"
    email_message                    = "Your Confirmation code is {####}"
    enable_case_sensitive            = true
    password_min_length              = 8
    password_require_lowercase       = true
    password_require_number          = true
    password_require_symbols         = true
    password_require_uppercase       = true
    temporary_password_validity_days = 7
    domain                           = "test-domain"
    custom_domain                    = "test-domain.example.com"
    certificate_arn                  = "arn:aws:acm:us-east-1:382904467012:certificate/ac1e569f-8069-4f28-b0de-90c9bfcd5e4c"
    hosted_zone_name                 = "example.com"
    record_type                      = "A"

    enabled = true

    resource_servers = [{
      identifier = "resource-server-1"
      name       = "resource-server-1"
      scope = [{
        scope_name        = "status.write"
        scope_description = "write order status"
        },
        {
          scope_name        = "order.write"
          scope_description = "write order data"
      }]
      },
      {
        identifier = "resource-server-2"
        name       = "resource-server-2"
        scope = [{
          scope_name        = "order.write"
          scope_description = "write order data"
          },
          {
            scope_name        = "status.write"
            scope_description = "write order data"
          },
          {
            scope_name        = "order.read"
            scope_description = "read order data"
        }]
      }
    ]

  app_clients = {
      client1 = {
        allowed_oauth_scopes                 = ["presto-brightree-service-prod/order.write", "presto-brightree-service-prod/status.write"]
        generate_secret                      = true
        refresh_token_validity               = 30
        prevent_user_existence_errors        = "ENABLED"
        allowed_oauth_flows                  = ["client_credentials"]
        allowed_oauth_flows_user_pool_client = true
        explicit_auth_flows = [
          "ALLOW_REFRESH_TOKEN_AUTH",
          "ALLOW_USER_SRP_AUTH",
          "ALLOW_CUSTOM_AUTH"
        ]
      }
      client2 = {
        allowed_oauth_scopes                 = ["presto-brightree-service-dev/status.write", "presto-brightree-service-dev/order.read"]
        generate_secret                      = true
        refresh_token_validity               = 90
        prevent_user_existence_errors        = "ENABLED"
        allowed_oauth_flows                  = ["client_credentials"]
        allowed_oauth_flows_user_pool_client = true
        explicit_auth_flows = [
          "ALLOW_REFRESH_TOKEN_AUTH",
          "ALLOW_USER_SRP_AUTH",
          "ALLOW_CUSTOM_AUTH"
        ]
      }

    }

  }
}

```
