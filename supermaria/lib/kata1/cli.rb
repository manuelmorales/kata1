require 'mini_cli'

module Kata1
  class Cli < MiniCli::Base
    desc 'start', 'Count the lines of the files inside a directory'
    def start directory
      Kata1::LinesCounter.count(directory)
    end
  end
end