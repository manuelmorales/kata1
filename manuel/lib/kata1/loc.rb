module Kata1
  class Loc
    attr_accessor :output

    def output
      @output ||= STDOUT
    end

    def for_dir(dir)
      total = files_in(dir).map do |f|
        lines_in_file(f)
      end.reduce(:+)

      output.puts "#{total} lines"
    end

    private

    def files_in(dir)
      Dir.glob("#{dir}/**/*").reject { |e| File.directory?(e) }
    end

    def lines_in_file(f)
      File.open(f,'r').each_line.count
    end
  end
end
