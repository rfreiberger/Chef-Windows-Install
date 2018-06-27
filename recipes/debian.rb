#
# Cookbook:: web_content
# Recipe:: debian
#
# Copyright:: 2018, The Authors, All Rights Reserved.


directory '/etc/Sumo' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

file '/etc/Sumo/example.txt' do
  content 'Hello World!'
  mode '0755'
  owner 'root'
  group 'root'
  action :create
end
