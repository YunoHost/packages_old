-- Section for localhost

consider_bosh_secure = true

-- This allows clients to connect to localhost. No harm in it.
VirtualHost "yunohost.org"
  authentication        = "ldap2"
  anonymous_login       = false
  ssl                   = {
    key         = "/etc/ssl/private/yunohost_key.pem";
    certificate = "/etc/ssl/certs/yunohost_crt.pem"
  }
