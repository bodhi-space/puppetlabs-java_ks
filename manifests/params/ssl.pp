# == Class java_ks::params
#
# This private class is called from java_ks::config used to manage the ssl properties if ssl is enabled
#
class java_ks::params::ssl {
  $keystore            = '/tmp/keystore' 
  $keystore_password   = ''
  $truststore          = '/tmp/truststore'
  $truststore_password = ''
  $truststore_keys     = {} 
  $user                = '' 
  $group               = '' 
  $service_name        = '' 
}
