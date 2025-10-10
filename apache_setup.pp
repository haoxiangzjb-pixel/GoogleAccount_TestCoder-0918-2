# This Puppet manifest installs the Apache web server.

class apache {
  package { 'apache2':
    ensure => installed,
  }

  service { 'apache2':
    ensure  => running,
    enable  => true,
    require => Package['apache2'],
  }
}

# Include the apache class to apply the configuration.
include apache