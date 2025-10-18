# Puppet class for network configuration
class puppet_network_config {
  # Parameters for network configuration
  $interface = $::networking['interfaces'][0]
  $ipaddress = $::ipaddress
  $netmask = $::netmask
  $gateway = $::networking['default_ip6_gateway'] ? {
    undef => $::networking['default_gateway'],
    default => $::networking['default_ip6_gateway'],
  }
  
  # Example network configuration resource
  file { '/etc/network/interfaces':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('puppet_network_config/network/interfaces.erb'),
    require => Package['network-manager'],
    notify  => Service['networking'],
  }
  
  # Network interface configuration
  define network_interface(
    $ipaddress,
    $netmask,
    $gateway = undef,
    $method = 'static'
  ) {
    file { "/etc/network/interfaces.d/${name}":
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('puppet_network_config/network/interface.erb'),
      notify  => Service['networking'],
    }
  }
  
  # DNS configuration
  file { '/etc/resolv.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('puppet_network_config/network/resolv.conf.epp'),
  }
  
  # Package installation for network management
  package { 'network-manager':
    ensure => installed,
  }
  
  # Service management
  service { 'networking':
    ensure  => running,
    enable  => true,
    require => Package['network-manager'],
  }
}

# Example usage of the class
# include puppet_network_config

# Or with parameters
class { 'puppet_network_config':
  # Override default parameters if needed
}