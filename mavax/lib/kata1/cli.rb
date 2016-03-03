require 'mini_cli'

module Kata1
  class Cli < MiniCli::Base
    desc 'execute', 'Runs the app'
    def start(folder_path, *_)
      app.run(folder_path)
    end

    private

    def app
      App
    end
  end
end
