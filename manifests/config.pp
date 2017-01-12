class java_ks::config(
  $user                  = $java_ks::user,
  $group                 = $java_ks::group,
  $keystore              = $java_ks::keystore,
  $keystore_password     = $java_ks::keystore_password,
  $key_password          = $java_ks::key_password,
  $truststore            = $java_ks::truststore,
  $truststore_password   = $java_ks::truststore_password,
  $service_name          = $java_ks::service_name,
) inherits java_ks::params {

  $truststore_keys  = deep_merge($java_ks::params::truststore_keys, $java_ks::truststore_keys)

  class { 'java_ks::config::global::ssl': }
}
