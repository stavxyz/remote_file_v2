#
# Cookbook:: RemoteFileV2
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.


bash 'say hello' do
  code <<-EOH
    echo "hello"
    EOH
end
