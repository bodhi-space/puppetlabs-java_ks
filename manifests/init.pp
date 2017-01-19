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
  
  $truststore           = getvar("::java_ks::params::ssl::truststore"),
  $truststore_password  = getvar("::java_ks::params::ssl::truststore_password"),
  $user                 = getvar("::java_ks::params::ssl::user"),
  $group                = getvar("::java_ks::params::ssl::group"),
  $certificate          = getvar("::java_ks::params::ssl::cert"),
  $truststoreconf       = hiera_hash("java_ks::config")

) inherits java_ks::params {

  validate_absolute_path($truststore)
  validate_string($truststore_password)
  validate_string($user)
  validate_string($group)
  validate_absolute_path($certificate)
  validate_hash($truststoreconf)

  contain 'java_ks::config'
}
