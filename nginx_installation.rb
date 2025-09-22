# Recipe for installing Nginx package
#
# This recipe installs the Nginx web server package
# and ensures the service is enabled and started.

package 'nginx' do
  action :install
end

service 'nginx' do
  action [:enable, :start]
end