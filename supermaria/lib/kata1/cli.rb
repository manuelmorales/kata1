require 'mini_cli'

module Kata1
  class Cli < MiniCli::Base
    desc 'start', 'Count the lines of the files inside a directory'
    def start directory
      n = Kata1::LinesCounter.new.count(directory)
      puts "#{n} lines"
    end
  end
end
