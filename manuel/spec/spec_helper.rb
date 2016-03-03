require_relative '../lib/kata1'
require 'rspec'
require'pry'

include Kata1

RSpec.configure do |c|
  c.disable_monkey_patching!
  c.color = true
end
