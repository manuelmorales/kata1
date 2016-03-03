module Kata1
  extend self

  def call(dir)
    count_ruby_lines(dir)
  end

  private

  def count_file_lines(file)
    File.foreach(file).inject(0) { |c, _line| c + 1 }
  end

  def ruby_files(dir)
    Dir["#{dir}/*"].select { |e| is_ruby_file? e }
  end

  def is_ruby_file?(file)
    File.file?(file) #&& File.extname(file) == '.rb'
  end

  def subdirectories(dir)
    Dir["#{dir}/*"].select { |e| File.directory?(e) }
  end

  def ruby_lines_in_dir(dir)
    ruby_files(dir).inject(0) { |c, file| c + count_file_lines(file) }
  end

  def count_ruby_lines(dir)
    ruby_lines_in_dir(dir) +
    subdirectories(dir).inject(0) { |c, sdir| c + count_ruby_lines(sdir) }
  end
end
