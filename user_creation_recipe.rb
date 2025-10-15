# Chef recipe to create a user

# Create a user with specified attributes
user 'example_user' do
  comment 'Example User'
  uid 1001
  gid 'users'
  home '/home/example_user'
  shell '/bin/bash'
  password '$1$somehashedpassword'  # This should be a properly hashed password
  action :create
end

# Create the user's home directory
directory '/home/example_user' do
  owner 'example_user'
  group 'users'
  mode '0755'
  action :create
  recursive true
end