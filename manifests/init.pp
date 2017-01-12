# vim: tabstop=2 expandtab shiftwidth=2 softtabstop=2 foldmethod=marker
#
# == Class: java_ks
#
# Full description of class java_ks here.
#
# === Parameters
# ---
#
class java_ks (
  
  $keystore                     = getvar("java_ks::params::keystore"),
  $keystore_password            = getvar("java_ks::params::keystore_password"),
  $key_password                 = getvar("java_ks::params::key_password"),
  $truststore                   = getvar("java_ks::params::truststore"),
  $truststore_password          = getvar("java_ks::params::truststore_password"),
  $truststore_keys              = getvar("java_ks::params::truststore_keys"),
  $service_name                 = getvar("java_ks::params::service_name"),
  $user                         = getvar("java_ks::params::user"),
  $group                        = getvar("java_ks::params::group"),

) inherits java_ks::params {

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

  contain 'java_ks::config'
}
