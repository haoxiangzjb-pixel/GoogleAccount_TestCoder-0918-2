# Класс Puppet для настройки сети
class { 'network':
  # Управление сетевыми интерфейсами
  manage_interfaces => true,
  # Управление маршрутами
  manage_routes     => true,
  # Управление файлом hosts
  manage_hosts      => true,
  # Базовые параметры сети
  dns_servers       => ['8.8.8.8', '8.8.4.4'],
  dns_domain        => 'example.com',
}