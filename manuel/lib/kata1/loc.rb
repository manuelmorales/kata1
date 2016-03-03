module Kata1
  class Loc
    attr_accessor :output

    def output
      @output ||= STDOUT
    end

    def for_dir(dir)
      total = Dir.glob("#{dir}/**/*").map do |f|
        File.open(f,'r').each_line.count
      end.reduce(:+)

      output.puts "#{total} lines"
    end
  end
end
