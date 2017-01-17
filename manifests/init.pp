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
  
  $keystore             = getvar("::java_ks::params::keystore"),
  $keystore_password    = getvar("::java_ks::params::keystore_password"),
  $truststore           = getvar("::java_ks::params::truststore"),
  $truststore_password  = getvar("::java_ks::params::truststore_password"),
  $truststore_keys      = getvar("::java_ks::params::truststore_keys"),
  $service_name         = getvar("::java_ks::params::service_name"),
  $user                 = getvar("::java_ks::params::user"),
  $group                = getvar("::java_ks::params::group"),
  $truststoreconf       = getvar("::java_ks::params::default_internalca"),
  $hieramerge           = false

) inherits java_ks::params {

  validate_absolute_path($keystore)
  validate_string($keystore_password)
  validate_absolute_path($truststore)
  validate_string($truststore_password)
  validate_hash($truststore_keys)
  validate_string($service_name)
  validate_string($user)
  validate_string($group)
  validate_hash($truststore_defaults)

  # Hiera hash merging support
  if $hieramerge {
    $x_truststoreconf = hiera_hash( 'java_ks::internalca'  , $truststoreconf  )
  } else {
    $x_truststoreconf    = $truststoreconf
  }



  class { 'java_ks::config': } ~> Service[$service_name]

  contain 'java_ks::config'
}
