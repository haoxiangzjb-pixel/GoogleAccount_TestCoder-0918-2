#
# Cookbook:: default
# Recipe:: default
#
# Copyright:: 2025, The Authors, All Rights Reserved.

# Install the nginx package
package 'nginx' do
  action :install
end

# Start the nginx service
service 'nginx' do
  action [:enable, :start]
end