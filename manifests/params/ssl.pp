# == Class java_ks::params
#
# This private class is called from java_ks::config used to manage the ssl properties if ssl is enabled
#
class java_ks::params::ssl {
  $certificate         = '/etc/openldap/cacerts/cacert.pem'
  $truststore_keys     = {} 
  $group               = '' 
  $truststore          = '/tmp/truststore'
  $truststore_password = ''
  $user                = '' 
}
