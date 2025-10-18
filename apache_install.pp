class apache {
  package { 'httpd':
    ensure => installed,
  }

  service { 'httpd':
    ensure  => running,
    enable  => true,
    require => Package['httpd'],
  }

  file { '/var/www/html/index.html':
    ensure  => file,
    content => "<html><body><h1>Hello from Puppet-managed Apache!</h1></body></html>",
    require => Service['httpd'],
  }
}

include apache