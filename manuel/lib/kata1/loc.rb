module Kata1
  class Loc
    cattr_accessor :output

    def self.for_dir(dir)
      total = Dir.glob("#{dir}/**/*").map do |f|
        File.open(f,'r').each_line.count
      end.reduce(:+)

      output.puts "#{total} lines"
    end

    def self.output
      @@output ||= STDOUT
    end
  end
end
