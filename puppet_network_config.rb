# Класс Puppet для настройки сети
class NetworkConfig {
  # Параметры класса
  param String $interface = 'eth0',
  param String $ip_address,
  param String $netmask = '255.255.255.0',
  param Optional[String] $gateway,
  param Optional[Array[String]] $dns_servers = []

  # Ресурс для управления файлом конфигурации интерфейса
  file { "/etc/network/interfaces.d/${interface}":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('network_config.erb'),
  }

  # Управление DNS-серверами (упрощённо, через /etc/resolv.conf)
  if $dns_servers {
    file { '/etc/resolv.conf':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => epp('resolv_conf.epp', { servers => $dns_servers }),
    }
  }

  # Перезапуск службы сети после изменений (требует пакет network-manager)
  exec { "restart_network_${interface}":
    command     => "/sbin/ifdown ${interface} && /sbin/ifup ${interface}",
    refreshonly => true,
    subscribe   => File["/etc/network/interfaces.d/${interface}"],
  }
}