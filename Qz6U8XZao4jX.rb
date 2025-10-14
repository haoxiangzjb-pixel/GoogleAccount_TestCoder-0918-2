# Recipe for installing a package

# This recipe installs the 'curl' package using apt.
# It is a simple example of a Chef recipe.

package 'curl' do
  action :install
end
