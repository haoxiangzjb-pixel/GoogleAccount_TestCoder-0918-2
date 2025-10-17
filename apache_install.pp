# Puppet manifest to install Apache web server
class apache_install {
  # Install the Apache package
  package { 'httpd':
    ensure => installed,
  }

  # Ensure the Apache service is running and enabled
  service { 'httpd':
    ensure    => running,
    enable    => true,
    require   => Package['httpd'],
  }

  # Create a basic index.html file
  file { '/var/www/html/index.html':
    ensure  => file,
    content => '<html><body><h1>Hello from Apache!</h1></body></html>',
    require => [Package['httpd'], Service['httpd']],
  }
}

# Include the class to apply the configuration
include apache_install