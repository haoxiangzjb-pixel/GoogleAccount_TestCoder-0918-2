# Puppet manifest to install Apache web server

class apache_install {
  package { 'apache2':
    ensure => installed,
    name   => $facts['os']['family'] ? {
      'RedHat' => 'httpd',
      'Debian' => 'apache2',
      default  => 'apache2',
    },
  }

  service { 'apache2':
    ensure  => running,
    name    => $facts['os']['family'] ? {
      'RedHat' => 'httpd',
      'Debian' => 'apache2',
      default  => 'apache2',
    },
    enable  => true,
    require => Package['apache2'],
  }
}

# Apply the class
include apache_install