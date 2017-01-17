# == Class java_ks::params
#
# This private class is called from java_ks::config used to manage the ssl properties if ssl is enabled
#
class java_ks::params::ssl {
  $truststore          = '/tmp/truststore'
  $truststore_password = ''
  $config      = {} 
  $user                = '' 
  $group               = '' 
}
