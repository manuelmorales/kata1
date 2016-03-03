
class Kata1
  def self.start directory
    ruby_files = Dir.glob("#{directory}/**/*").select { |file| file.match(/.rb/) }
    total_lines = 0
    ruby_files.each do |filename|
      count = File.foreach(filename).inject(0) {|c, line| c+1}
      total_lines += count
      Kernel.puts "File #{filename} has #{count} lines"
    end
    Kernel.puts "Total number of lines is #{total_lines}"
  end
end
