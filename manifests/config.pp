# vim: tabstop=2 expandtab shiftwidth=2 softtabstop=2 foldmethod=marker
#
# == Class: java_ks::config
#
# Configures java_ks
#
# Private class: Don't call directly
#
class java_ks::config inherits java_ks {

  define internalca(
    $cert   = $cert,
    $user   = $user,
    $group  = $group,
    $truststore = $truststore,
    $truststore_password  = $truststore_password) {

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
  
  create_resources(internalca, $truststore_keys, $truststore_defaults)


}
