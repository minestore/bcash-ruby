require 'coveralls'
Coveralls.wear!

require 'pry'
require 'vcr'
require 'bcash'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.default_cassette_options = {
    match_requests_on: [:method, :uri, :headers, :body]
  }
  c.hook_into :webmock
end

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  
  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  config.before(:suite) do
    # Bcash.configure do |c|
    #   c.email = 'user@gmail.com'
    # end
  end
end
