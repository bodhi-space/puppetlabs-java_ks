# Author::    Liam Bennett (mailto:lbennett@opentable.com)
# Copyright:: Copyright (c) 2013 OpenTable Inc
# License::   MIT

# == Class java_ks::config::ssl
#
# This private class is called from java_ks::config used to manage the ssl properties if ssl is enabled
#
class java_ks::config::ssl(
  $keystore            = $java_ks::config::keystore,
  $keystore_password   = $java_ks::config::keystore_password,
  $key_password        = $java_ks::config::key_password,
  $truststore          = $java_ks::config::truststore,
  $truststore_password = $java_ks::config::truststore_password,
  $truststore_keys     = $java_ks::config::truststore_keys,
  $user                = $java_ks::config::user,
  $group               = $java_ks::config::group,
  $service_name        = $java_ks::service_name,
) {

  Ini_setting {
    notify => Service[$service_name],
  }

  define java_ks::config::ssl::truststore_file ($cert=$cert, $user=$user, $group=$group, $truststore=$truststore, $truststore_password=$truststore_password) {
    file { "${truststore}-${title}.cert":
      ensure  => present,
      owner   => $user,
      group   => $group,
      mode    => '0640',
      content => "$cert",
    }
    java_ks { "${title}:${truststore}":
      ensure        => latest,
      certificate   => "${truststore}-${title}.cert",
      password      => $truststore_password,
      trustcacerts  => true,
    }
  }
  $truststore_defaults = {
    user                => $user,
    group               => $group,
    truststore          => $truststore,
    truststore_password => $truststore_password,
  }
  create_resources(java_ks::config::ssl::truststore_file, $truststore_keys, $truststore_defaults)

  ini_setting { 'keystore':
    ensure  => present,
    path    => $properties_file,
    section => '',
    setting => 'keystore',
    value   => $keystore,
    require => File[$properties_file]
  }

  ini_setting { 'keystore.password':
    ensure  => present,
    path    => $properties_file,
    section => '',
    setting => 'keystore.password',
    value   => $keystore_password,
    require => File[$properties_file]
  }

  ini_setting { 'key.password':
    ensure  => present,
    path    => $properties_file,
    section => '',
    setting => 'key.password',
    value   => $key_password,
    require => File[$properties_file]
  }

  ini_setting { 'truststore':
    ensure  => present,
    path    => $properties_file,
    section => '',
    setting => 'truststore',
    value   => $truststore,
    require => File[$properties_file]
  }

  ini_setting { 'truststore.password':
    ensure  => present,
    path    => $properties_file,
    section => '',
    setting => 'truststore.password',
    value   => $truststore_password,
    require => File[$properties_file]
  }

  file { $properties_file:
    ensure  => present,
    owner   => $user,
    group   => $group,
    mode    => '0640',
    notify  => Service[$service_name],
    require => File[$properties_dir]
  }
}
