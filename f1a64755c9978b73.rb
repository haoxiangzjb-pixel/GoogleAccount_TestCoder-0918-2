# Chef recipe to create a user
user 'newuser' do
  home '/home/newuser'
  shell '/bin/bash'
  action :create
end
