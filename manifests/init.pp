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
  
  $configkeystore             = getvar("::java_ks::params::ssl::configkeystore"),
  $configkeystore_password    = getvar("::java_ks::params::ssl::configkeystore_password"),
  $configtruststore           = getvar("::java_ks::params::ssl::configtruststore"),
  $configtruststore_password  = getvar("::java_ks::params::ssl::configtruststore_password"),
  $configtruststore_keys      = getvar("::java_ks::params::ssl::configtruststore_keys"),
  $service_name               = getvar("::java_ks::params::ssl::configservice_name"),
  $configuser                 = getvar("::java_ks::params::ssl::configuser"),
  $configgroup                = getvar("::java_ks::params::ssl::configgroup"),
  $configtruststoreconf       = getvar("::java_ks::params::ssl::default_internalca"),
  $hieramerge                 = false

) inherits java_ks::params {

  validate_absolute_path($configkeystore)
  validate_string($configkeystore_password)
  validate_absolute_path($configtruststore)
  validate_string($configtruststore_password)
  validate_hash($configtruststore_keys)
  validate_string($service_name)
  validate_string($configuser)
  validate_string($configgroup)
  validate_hash($truststore_defaults)

  # Hiera hash merging support
  if $hieramerge {
    $x_truststoreconf = hiera_hash('java_ks::internalca', $truststoreconf)
  } else {
    $x_truststoreconf    = $truststoreconf
  }



  class { 'java_ks::config': } ~> Service[$service_name]

  contain 'java_ks::config'
}
