# Chef Recipe: install_package_random_recipe.rb
#
# This recipe installs a package using the package resource.

# Example: Installing the 'git' package
package 'git' do
  action :install
end

# Example: Installing the 'curl' package
# package 'curl' do
#  action :install
# end