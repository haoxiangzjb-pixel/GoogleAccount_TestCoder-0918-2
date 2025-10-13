#
# Cookbook:: my_cookbook
# Recipe:: create_user
#
# Copyright:: 2025, Your Name
#

# This recipe creates a user account.

user 'new_user' do
  comment 'A new user account'
  uid 1234
  gid 'users'
  home '/home/new_user'
  shell '/bin/bash'
  password '$1$hashed_password_here' # Use a properly hashed password
  action [:create, :manage]
end