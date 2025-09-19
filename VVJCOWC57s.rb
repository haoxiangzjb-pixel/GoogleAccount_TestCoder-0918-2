# Chef recipe to create a user
# File name: VVJCOWC57s.rb

# Create a system user
user 'myuser' do
  comment 'My Custom User'
  uid 1001
  gid 'users'
  home '/home/myuser'
  shell '/bin/bash'
  password '$1$xyz$wC5ddNxa4j7VmlsxMNA9l0' # This is just an example, normally you'd use a real encrypted password
  action :create
end

# Create the user's home directory
directory '/home/myuser' do
  owner 'myuser'
  group 'users'
  mode '0755'
  action :create
end