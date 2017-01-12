class java_ks (
  $keystore                     = $java_ks::params::keystore,
  $keystore_password            = $java_ks::params::keystore_password,
  $key_password                 = $java_ks::params::key_password,
  $truststore                   = $java_ks::params::truststore,
  $truststore_password          = $java_ks::params::truststore_password,
  $truststore_keys              = $java_ks::params::truststore_keys,
  $service_name                 = $java_ks::params::service_name,
  $user                         = $java_ks::params::user,
  $group                        = $java_ks::params::group,
) inherits java_ks::params {

  validate_absolute_path($keystore)
  validate_absolute_path($keystore)
  validate_string($keystore_password)
  validate_string($key_password)
  validate_absolute_path($truststore)
  validate_string($truststore_password)
  validate_hash($truststore_keys)
  validate_string($service_name)
  validate_string($user)
  validate_string($group)

  class { 'java_ks': } ~> Service[$service_name]
}
