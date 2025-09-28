# Класс Puppet для настройки сети
class network_config {
  # Параметры для настройки интерфейса
  $interface_name = 'eth0' # Имя интерфейса
  $ip_address = '192.168.1.10' # IP-адрес
  $netmask = '255.255.255.0' # Маска подсети
  $gateway = '192.168.1.1' # Шлюз по умолчанию

  # Ресурс для управления сетевым интерфейсом
  # В реальной среде Puppet могут использоваться более специфичные провайдеры
  # или модули, такие как puppetlabs-network.
  file { "/etc/network/interfaces.d/${interface_name}":
    ensure  => file,
    content => "
auto ${interface_name}
iface ${interface_name} inet static
    address ${ip_address}
    netmask ${netmask}
    gateway ${gateway}
",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['ifupdown'], # Зависимость от пакета ifupdown
    notify  => Exec['restart_network'], # Перезапуск сети при изменении
  }

  # Ресурс для перезапуска сетевого сервиса
  exec { 'restart_network':
    command     => '/sbin/ifdown ${interface_name} && /sbin/ifup ${interface_name}',
    refreshonly => true, # Выполняется только при уведомлении
  }
}