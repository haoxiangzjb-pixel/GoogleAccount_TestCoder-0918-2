#
# Cookbook:: default
# Recipe:: default
#
# Copyright:: 2025, The Authors, All Rights Reserved.

# Установка пакета nginx
package 'nginx' do
  action :install
end

# Включение и запуск сервиса nginx
service 'nginx' do
  action [:enable, :start]
end