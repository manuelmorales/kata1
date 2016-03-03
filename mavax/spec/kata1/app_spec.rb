require 'spec_helper'
require 'stringio'

RSpec.describe App do
  describe '.run' do
    it 'returns a report of lines of code per file' do
      buffer = StringIO.new
      subject.run('spec/assets', buffer)
      buffer.rewind
      lines = buffer.read.split("\n")
      expect(lines[0]).to match(%r{\AAnalyzing.+spec/assets\Z})
      expect(lines[1]).to match(%r{spec/assets/file 11\Z})
      expect(lines[2]).to match(%r{spec/assets/folder/file 6\Z})
      expect(lines[3]).to eq 'Total line count: 17'
    end
  end
end
