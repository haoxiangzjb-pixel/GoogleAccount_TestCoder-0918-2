# Puppet manifest to install and manage Apache
class apache {
  package { 'httpd':
    ensure => installed,
  }

  service { 'httpd':
    ensure  => running,
    enable  => true,
    require => Package['httpd'],
  }
}

# Include the apache class to apply the configuration
include apache