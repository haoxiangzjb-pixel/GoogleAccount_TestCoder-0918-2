# Chef Recipe to Install a Package
#
# This recipe installs a package using Chef's package resource.

# Install the curl package
package 'curl' do
  action :install
end

# Example of installing multiple packages
%w[wget git vim].each do |pkg|
  package pkg do
    action :install
  end
end

# You can also specify a specific package version
# package 'nginx' do
#   version '1.14.0'
#   action :install
# end

# Or ensure the latest version is installed
# package 'openssl' do
#   action :upgrade
# end