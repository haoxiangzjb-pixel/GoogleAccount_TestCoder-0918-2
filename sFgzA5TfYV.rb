# Chef recipe to create a user
# Filename: sFgzA5TfYV.rb

# Create a new user named 'myuser'
user 'myuser' do
  comment 'My User'
  uid 1001
  gid 'users'
  home '/home/myuser'
  shell '/bin/bash'
  password '$1$xyz$wB45A93aK4X.EeO./zJ3v0' # This is a hashed password
  action :create
end

# Create the user's home directory
directory '/home/myuser' do
  owner 'myuser'
  group 'users'
  mode '0755'
  action :create
end