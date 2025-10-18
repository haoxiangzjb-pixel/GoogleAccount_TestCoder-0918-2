class apache {
  package { 'httpd':
    ensure => installed,
  }

  service { 'httpd':
    ensure => running,
    enable => true,
    require => Package['httpd'],
  }

  file { '/var/www/html/index.html':
    content => "<html><body><h1>Hello from Puppet!</h1></body></html>",
    require => Package['httpd'],
  }
}

include apache