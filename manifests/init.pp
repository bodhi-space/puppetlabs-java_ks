# vim: tabstop=2 expandtab shiftwidth=2 softtabstop=2 foldmethod=marker
#
# == Class: java_ks
#
# Full description of class java_ks here.
#
# === Parameters
# ---
#
class java_ks(
  
  $keystore             = getvar("::java_ks::params::ssl::keystore"),
  $keystore_password    = getvar("::java_ks::params::ssl::keystore_password"),
  $truststore           = getvar("::java_ks::params::ssl::truststore"),
  $truststore_password  = getvar("::java_ks::params::ssl::truststore_password"),
  $service_name         = getvar("::java_ks::params::ssl::service_name"),
  $user                 = getvar("::java_ks::params::ssl::user"),
  $group                = getvar("::java_ks::params::ssl::group"),
  $truststoreconf       = getvar("::java_ks::params::ssl::config"),

) inherits java_ks::params {

  validate_absolute_path($keystore)
  validate_string($keystore_password)
  validate_absolute_path($truststore)
  validate_string($truststore_password)
  validate_hash($truststoreconf)
  validate_string($service_name)
  validate_string($user)
  validate_string($group)

  class { 'java_ks::config': } ~> Service[$service_name]

  contain 'java_ks::config'
}
