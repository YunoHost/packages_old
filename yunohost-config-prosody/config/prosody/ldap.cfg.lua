storage        = 'ldap'

ldap = {
    hostname      = 'localhost',                    -- LDAP server location

    user = {
      basedn        = 'ou=users,dc=yunohost,dc=org',
      filter        = '(&(objectClass=posixAccount)(!(uid=admin)))',
      usernamefield = 'uid',
      namefield     = 'displayName',
    },

    groups = {
      basedn      = 'ou=Groups,dc=yunohost,dc=org',
      memberfield = 'memberUid',
      namefield   = 'cn',

      {
        name  = 'admins',
        cn    = 'admins',
        admin = true,
      },
    },

    vcard_format = {
      displayname = 'displayName',
      mailer      = 'mail',
      name        = {
        family    = 'sn',
        given     = 'givenName',
      },
      nickname    = 'uid',
      photo       = {
        type   = 'image/jpeg',
        binval = 'jpegPhoto',
      }
    },
}
