# Класс Puppet для настройки сети
class NetworkConfig
  # Инициализирует объект NetworkConfig с параметрами интерфейса
  def initialize(interface_name, ip_address, netmask, gateway = nil)
    @interface = interface_name
    @ip_address = ip_address
    @netmask = netmask
    @gateway = gateway
  end

  # Возвращает Puppet манифест для настройки интерфейса
  def generate_interface_manifest
    manifest = "# Манифест Puppet для настройки интерфейса #{@interface}\n"
    manifest += "network::interface { '#{@interface}':\n"
    manifest += "  ipaddress => '#{@ip_address}',\n"
    manifest += "  netmask   => '#{@netmask}',\n"
    manifest += "  enable    => true,\n"
    if @gateway
      manifest += "  gateway   => '#{@gateway}',\n"
    end
    manifest += "}\n"
    return manifest
  end

  # Печатает сгенерированный манифест
  def print_manifest
    puts generate_interface_manifest
  end
end

# Пример использования
# config = NetworkConfig.new('eth0', '192.168.1.10', '255.255.255.0', '192.168.1.1')
# config.print_manifest