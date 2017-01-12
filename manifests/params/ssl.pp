# == Class java_ks::params
#
# This private class is called from java_ks::config used to manage the ssl properties if ssl is enabled
#
class java_ks::params::ssl {
  $keystore            = $java_ks::config::keystore,
  $keystore_password   = $java_ks::config::keystore_password,
  $key_password        = $java_ks::config::key_password,
  $truststore          = $java_ks::config::truststore,
  $truststore_password = $java_ks::config::truststore_password,
  $truststore_keys     = $java_ks::config::truststore_keys,
  $user                = $java_ks::config::user,
  $group               = $java_ks::config::group,
  $service_name        = $java_ks::service_name,

}
