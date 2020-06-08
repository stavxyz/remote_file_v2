require 'chef/resource'
require 'pry'

class Chef
  class Resource::RemoteFileV2 < Resource::RemoteFile

    resource_name :remote_file_v2

  end
end

class Chef
  class Provider::RemoteFileV2 < Provider::RemoteFile

    provides :remote_file_v2

    def load_current_resource
      @current_resource = Resource::RemoteFileV2.new(new_resource.name)
      super
    end

    class HTTP < Chef::Provider::RemoteFile::HTTP

      def fetch
        File.open('/tmp/asdf.txt', 'w') { |file| file.write("hello") }
        Chef::Log.info("--------WELCOME TO REMOTEFILEV2 --------")
        
        http = Chef::HTTP::Simple.new(uri, http_client_opts)
        orig_tempfile = Chef::FileContentManagement::Tempfile.new(@new_resource).tempfile
        puts "hellooooooooooooooooooooooooooooooooooooo"
        if want_progress?
          tempfile = http.streaming_request_with_progress(uri, headers, orig_tempfile) do |size, total|
            events.resource_update_progress(new_resource, size, total, progress_interval)
          end
        else
          tempfile = http.streaming_request(uri, headers, orig_tempfile)
        end
        if tempfile
          update_cache_control_data(tempfile, http.last_response)
          tempfile.close
        else
          # cache_control shows the file is unchanged, so we got back nil from the streaming_request above, and it is
          # now our responsibility to unlink the tempfile we created
          orig_tempfile.close
          orig_tempfile.unlink
        end
        tempfile
      end

    end

  end
end
