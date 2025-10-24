# Puppet class for network configuration
class puppet_network_config {
  # Define network interface parameters
  $interface = $facts['networking']['primary']
  $ip_address = $facts['networking']['ip']
  $netmask = $facts['networking']['netmask']
  $gateway = $facts['networking']['default_gateway']

  # Example: Configure a network interface
  file { '/etc/network/interfaces.d/puppet-config':
    ensure  => file,
    content => template('puppet_network_config/network_interface.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['net-tools'],
    notify  => Exec['restart-networking'],
  }

  # Example: Install network utilities
  package { 'net-tools':
    ensure => installed,
  }

  # Example: Restart networking service after changes
  exec { 'restart-networking':
    command     => '/sbin/service networking restart',
    refreshonly => true,
  }

  # Example: Configure DNS settings
  file { '/etc/resolv.conf':
    ensure  => file,
    content => "nameserver 8.8.8.8\nnameserver 8.8.4.4\n",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # Example: Configure hostname
  file { '/etc/hostname':
    ensure  => file,
    content => $facts['hostname'],
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}

# Define a network interface resource type
define puppet_network_config::interface (
  String $ipaddress,
  String $netmask,
  Optional[String] $gateway = undef,
  Boolean $ensure = true,
) {
  # Create interface configuration file
  file { "/etc/network/interfaces.d/${name}":
    ensure  => $ensure ? { true => file, false => absent },
    content => template('puppet_network_config/interface.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['net-tools'],
    notify  => Exec['restart-networking'],
  }
}