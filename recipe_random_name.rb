# Recipe for installing a package

# Example: Install the 'curl' package
package 'curl' do
  action :install
end

# Example: Install the 'vim' package with a specific version (if applicable)
# package 'vim' do
#   version '2:8.2.2372-1ubuntu2'
#   action :install
# end

# Example: Ensure the 'apache2' package is not installed
# package 'apache2' do
#   action :remove
# end
