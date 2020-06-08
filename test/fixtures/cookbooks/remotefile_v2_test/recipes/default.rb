remote_file '/var/local/foo.txt' do
  source 'https://gist.githubusercontent.com/stavxyz/6ccb9e218cb82799026dcc829c6f49be/raw/d057928f4d5a217b89234cfc4bd83a145736a3ba/hello.txt'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

require 'pry'
binding.pry

remote_file_v2 '/var/local/bar.txt' do
  source 'https://gist.githubusercontent.com/stavxyz/6ccb9e218cb82799026dcc829c6f49be/raw/d057928f4d5a217b89234cfc4bd83a145736a3ba/hello.txt'
  show_progress true
  atomic_update true
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
