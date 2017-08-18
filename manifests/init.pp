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
  $certificate          = getvar("::java_ks::params::ssl::certificate"),
  $truststore_keys      = hiera_hash("java_ks::truststore_keys",{}),
  $config_class_options = hiera_hash("java_ks::config_class_options",{})

) inherits java_ks::params {

  validate_absolute_path($truststore)
  validate_string($truststore_password)
  validate_string($user)
  validate_string($group)
  validate_absolute_path($certificate)
  validate_hash($truststore_keys)

  contain 'java_ks::config' 

  if has_key($config_class_options, 'before') {
    $config_class_options['before'] -> Class['java_ks::config'] 
  }
  if has_key($config_class_options, 'notify') {
    Class['java_ks::config'] ~> $config_class_options['notify']
  }
  if has_key($config_class_options, 'before') {
    Class['java_ks::config'] -> $config_class_options['before']
  }
}
