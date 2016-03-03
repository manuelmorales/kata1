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
      Dir.glob("#{dir}/**/*").reject { |file| File.directory?(file) }
    end

    def lines_in_file(file_path)
      File.read(file_path).lines.size
    end
  end
end
