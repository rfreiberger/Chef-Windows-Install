#
# Cookbook:: web_content
# Recipe:: windows
#
# Copyright:: 2018, The Authors, All Rights Reserved.


directory 'C:\\Sumo\\' do
  rights :full_control, 'Everyone'
  inherits false
  action :create
end

file 'C:\\Sumo\example.txt' do
  content 'Hello World!'
  rights :full_control, 'Everyone'
  action :create
end
