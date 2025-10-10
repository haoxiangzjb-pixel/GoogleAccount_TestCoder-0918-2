# Recipe to install a package using Chef on Debian/Ubuntu

# Example: Install the 'curl' package
apt_package 'curl' do
  action :install
end