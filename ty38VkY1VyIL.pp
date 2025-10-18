# Puppet class for network configuration
class puppet_network_config {
  # Parameters for network configuration
  $interface = 'eth0',
  $ip_address = '192.168.1.10',
  $netmask = '255.255.255.0',
  $gateway = '192.168.1.1',
  $dns_servers = ['8.8.8.8', '8.8.4.4']
) {
  
  # Configure network interface
  file { "/etc/network/interfaces.d/${interface}":
    ensure  => file,
    content => template('puppet_network_config/interface.erb'),
    require => Package['network-manager'],
    notify  => Service['networking'],
  }

  # Ensure network manager package is installed
  package { 'network-manager':
    ensure => installed,
  }

  # Manage the main network configuration
  file { '/etc/network/interfaces':
    ensure  => file,
    content => template('puppet_network_config/base_interfaces.erb'),
    backup  => 'local',
  }

  # Configure DNS settings
  file { '/etc/resolv.conf':
    ensure  => file,
    content => epp('puppet_network_config/resolv.conf.epp',
      { 'dns_servers' => $dns_servers }
    ),
    require => Package['netbase'],
  }

  # Ensure networking service is running
  service { 'networking':
    ensure  => running,
    enable  => true,
    require => [Package['network-manager'], File['/etc/network/interfaces']],
  }
}

# Define resource for configuring a specific network interface
define puppet_network_config::interface(
  $ip_address,
  $netmask = '255.255.255.0',
  $gateway = undef,
  $method = 'static'
) {
  # Create interface configuration file
  file { "/etc/network/interfaces.d/${name}":
    ensure  => file,
    content => inline_template("
# Interface configuration for <%= @name %>
auto <%= @name %>
iface <%= @name %> inet <%= @method %>
    address <%= @ip_address %>
    netmask <%= @netmask %>
    <% if @gateway -%>
    gateway <%= @gateway %>
    <% end -%>
"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}