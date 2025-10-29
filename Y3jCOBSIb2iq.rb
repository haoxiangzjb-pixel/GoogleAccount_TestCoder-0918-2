# Chef recipe to install a package
# This recipe installs the curl package as an example

package 'curl' do
  action :install
end

# You can customize this recipe to install any package you need
# Just replace 'curl' with the package name of your choice