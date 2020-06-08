# InSpec test for recipe RemoteFileV2::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe file('/var/local/foo.txt') do
    its('content') { should match(%r{👍}) }
    its('mode') { should cmp '0755' }
end

# This is an example test, replace it with your own test.
describe file('/var/local/bar.txt') do
    its('content') { should match(%r{👍}) }
    its('mode') { should cmp '0755' }
end
