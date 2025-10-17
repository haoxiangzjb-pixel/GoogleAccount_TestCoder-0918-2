# A Chef recipe to install the git package

package 'git' do
  action :install
end

# Example of a more complex package installation with version specification
# package 'git' do
#   version '1:2.34.1-1ubuntu1.2'  # Specify version if needed
#   action :install
# end

# Example for different platforms
# package 'git' do
#   case node['platform_family']
#   when 'rhel', 'fedora'
#     package_name 'git-core'
#   when 'debian'
#     package_name 'git'
#   end
#   action :install
# end