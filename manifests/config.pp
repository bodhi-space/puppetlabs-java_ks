# vim: tabstop=2 expandtab shiftwidth=2 softtabstop=2 foldmethod=marker
#
# == Class: java_ks::config
#
# Configures java_ks
#
# Private class: Don't call directly
#
class java_ks::config inherits java_ks {

  define truststore_file(
    $certificate          = $certificate,
    $user                 = $user,
    $group                = $group,
    $truststore           = $truststore,
    $truststore_password  = $truststore_password) {

    java_ks { "${title}:${truststore}":
      ensure        => latest,
      certificate   => $certficate,
      password      => $truststore_password,
      trustcacerts  => true,
    }
  }

  $truststore_defaults = {
    user                => $user,
    group               => $group,
    truststore          => $truststore,
    truststore_password => $truststore_password,
    certificate         => $certificate,
  }
  
  create_resources(truststore_file, $truststore_keys, $truststore_defaults)

}
