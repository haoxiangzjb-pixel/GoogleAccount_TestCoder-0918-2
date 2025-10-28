# Chef Recipe to Install a Package
#
# This recipe installs a package using the package resource

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

# You can also specify a package version if needed
# package 'nginx' do
#   version '1.14.0'
#   action :install
# end