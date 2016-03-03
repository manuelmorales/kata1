module Kata1
  module App
    class << self
      def run(folder_path, output = STDOUT)
        expanded_folder_path = File.expand_path(folder_path)
        output.puts "Analyzing #{expanded_folder_path}"
        lines_per_file = get_lines_per_file(expanded_folder_path)
        lines_per_file.each do |(file, line_count)|
          output.puts "#{file} #{line_count}"
        end
        output.puts "Total line count: #{lines_per_file.values.reduce(:+)}"
      end

      private

      def get_lines_per_file(folder_path)
        Dir.glob("#{folder_path}/**/*")
           .reject { |file| File.directory?(file) }
           .map { |file| { file => File.read(file).lines.count } }
           .reduce(:merge!)
      end
    end
  end
end
