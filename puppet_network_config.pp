# Puppet class for network configuration
class puppet_network_config {
  # Define network interface configuration parameters
  $interface = 'eth0'
  $ip_address = '192.168.1.10'
  $netmask = '255.255.255.0'
  $gateway = '192.168.1.1'
  $dns_servers = ['8.8.8.8', '8.8.4.4']
  
  # Configure network interface
  file { "/etc/network/interfaces.d/${interface}":
    ensure  => file,
    content => template('puppet_network_config/interface.erb'),
    require => Package['network-manager'],
    notify  => Service['networking'],
  }
  
  # Set up DNS configuration
  file { '/etc/resolv.conf':
    ensure  => file,
    content => epp('puppet_network_config/resolv.conf.epp'),
    require => Package['resolvconf'],
  }
  
  # Ensure network manager package is installed
  package { 'network-manager':
    ensure => installed,
  }
  
  # Ensure resolvconf package is installed
  package { 'resolvconf':
    ensure => installed,
  }
  
  # Manage networking service
  service { 'networking':
    ensure  => running,
    enable  => true,
    require => [
      Package['network-manager'],
      File["/etc/network/interfaces.d/${interface}"],
    ],
  }
  
  # Configure hostname if needed
  file { '/etc/hostname':
    ensure  => file,
    content => "${hostname}\n",
    mode    => '0644',
  }
  
  # Configure hosts file
  file { '/etc/hosts':
    ensure  => file,
    content => template('puppet_network_config/hosts.erb'),
    mode    => '0644',
  }
}

# Define a defined type for network interfaces
define network_interface(
  String $ip,
  String $netmask = '255.255.255.0',
  Boolean $dhcp = false,
  Boolean $onboot = true
) {
  if $dhcp {
    $config_content = "iface ${name} inet dhcp\n"
  } else {
    $config_content = "iface ${name} inet static\naddress ${ip}\nnetmask ${netmask}\n"
  }
  
  file { "/etc/network/interfaces.d/${name}":
    ensure  => file,
    content => "auto ${name}\n${config_content}",
    mode    => '0644',
  }
}