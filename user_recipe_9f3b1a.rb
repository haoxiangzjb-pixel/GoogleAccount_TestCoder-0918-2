#
# Cookbook Name:: my_cookbook
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

user 'new_user' do
  comment 'A new user account'
  home '/home/new_user'
  shell '/bin/bash'
  password '$1$hashed_password$example' # This should be a real hashed password
  action [:create, :manage]
end
