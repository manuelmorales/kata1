require_relative '../lib/kata1'
require 'rspec'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

$LOAD_PATH << File.join(File.dirname(__FILE__),'..')
require 'config/environment'

include Kata1

RSpec.configure do |c|
  c.disable_monkey_patching!
  c.color = true
end
