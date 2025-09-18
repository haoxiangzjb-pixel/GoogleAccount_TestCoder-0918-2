# Chef recipe to create a user
# This recipe creates a new user with specified attributes

user 'my_new_user' do
  comment 'My New User'
  uid 1001
  gid 1001
  home '/home/my_new_user'
  shell '/bin/bash'
  password '$1$xyz$wHSvF4Ryq9p8Mx8Cf3Y2L0' # Example encrypted password
  action :create
end