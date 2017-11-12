require 'webmock/rspec'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock
  c.default_cassette_options = {
      :match_requests_on => [:method,
            VCR.request_matchers.uri_without_param(:api_key)]
  }
  c.configure_rspec_metadata!
end
