#
# Cookbook:: web_content
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

case node['platform_family']
  when 'rhel', 'amazon', 'linux'
    include_recipe 'Chef-Windows-Install::rhel'
  when 'debian'
    include_recipe 'Chef-Windows-Install::debian'
  when 'windows'
    include_recipe 'Chef-Windows-Install::windows'
end
