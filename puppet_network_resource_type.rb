# frozen_string_literal: true

require 'puppet'

Puppet::Type.newtype(:network_interface) do
  @doc = 'Manages network interfaces.'

  ensurable

  newparam(:name, namevar: true) do
    desc 'The name of the network interface.'
  end

  newproperty(:ipaddress) do
    desc 'The IP address for the interface.'
    validate do |value|
      # Basic IP address validation
      unless value =~ /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/
        raise ArgumentError, "Invalid IP address format: #{value}"
      end
    end
  end

  newproperty(:netmask) do
    desc 'The netmask for the interface.'
    validate do |value|
      # Basic netmask validation
      unless value =~ /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/
        raise ArgumentError, "Invalid netmask format: #{value}"
      end
    end
  end

  newproperty(:gateway) do
    desc 'The default gateway for the interface.'
    validate do |value|
      # Basic IP address validation
      unless value =~ /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/
        raise ArgumentError, "Invalid gateway format: #{value}"
      end
    end
  end
end