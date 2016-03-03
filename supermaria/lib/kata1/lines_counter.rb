module Kata1
  class LinesCounter

    def count directory
      count = 0
      Dir.foreach(directory) do |file|
        begin
          open_file = File.open(directory + '/' + file, 'r')
          file_lines_count = open_file.readlines.size
          count = count + file_lines_count
        rescue Errno::EISDIR => e
            puts "Trying to open a directory"
        ensure
          open_file.close
        end
      end
      count
    end
  end
end