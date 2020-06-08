# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'example-remotefile-v2'

# Where to find external cookbooks:
default_source :supermarket

cookbook 'remotefile_v2_test', path: 'test/fixtures/cookbooks/remotefile_v2_test'
cookbook 'remotefile_v2', path: '.'

run_list 'remotefile_v2::default'
named_run_list 'test_fixture_cookbook', 'remotefile_v2_test::default'

# Specify a custom source for a single cookbook:
# cookbook 'example_cookbook', path: '../cookbooks/example_cookbook'
