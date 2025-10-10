# Класс Puppet для настройки сети
class NetworkConfig
  # Инициализирует объект NetworkConfig с параметрами интерфейса
  def initialize(interface_name, ip_address, netmask, gateway = nil)
    @interface_name = interface_name
    @ip_address = ip_address
    @netmask = netmask
    @gateway = gateway
  end

  # Генерирует строку ресурса Puppet для интерфейса (упрощённый пример)
  def puppet_interface_resource
    resource = "network::interface { '#{@interface_name}':\n"
    resource += "  ipaddress => '#{@ip_address}',\n"
    resource += "  netmask   => '#{@netmask}',\n"
    resource += "  onboot    => 'yes',\n"
    resource += "  type      => 'eth',\n"
    resource += "}\n"
    resource
  end

  # Генерирует строку ресурса Puppet для шлюза (упрощённый пример)
  def puppet_route_resource
    return "" if @gateway.nil? || @gateway.empty?

    resource = "network::route { 'default_via_#{@gateway}':\n"
    resource += "  gateway => '#{@gateway}',\n"
    resource += "  target  => '0.0.0.0',\n"
    resource += "}\n"
    resource
  end

  # Сохраняет сгенерированные ресурсы Puppet в файл
  def save_to_file(filename)
    File.open(filename, 'w') do |file|
      file.write(puppet_interface_resource)
      file.write(puppet_route_resource)
    end
    puts "Конфигурация Puppet сохранена в #{filename}"
  rescue => e
    puts "Ошибка при сохранении в файл: #{e.message}"
  end
end

# Пример использования:
# config = NetworkConfig.new('eth0', '192.168.1.100', '255.255.255.0', '192.168.1.1')
# config.save_to_file('network_config.pp')