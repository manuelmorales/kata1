require 'spec_helper'
require 'stringio'

RSpec.describe App do
  describe '.run' do

    def get_output
      buffer = StringIO.new
      subject.run('spec/assets', buffer)
      buffer.rewind
      buffer.read.split("\n")
    end

    it 'returns a report of lines of code per file' do
      lines = get_output
      expect(lines[1]).to match(%r{spec/assets/file 11\Z})
      expect(lines[2]).to match(%r{spec/assets/folder/file 6\Z})
    end

    it 'returns the main directory' do
      lines = get_output
      expect(lines[0]).to match(%r{\AAnalyzing.+spec/assets\Z})
    end

    it 'returns the total number of lines' do
      lines = get_output
      expect(lines[3]).to eq 'Total line count: 17'
    end
  end
end
