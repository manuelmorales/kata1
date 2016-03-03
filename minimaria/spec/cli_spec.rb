require 'spec_helper'

RSpec.describe 'Kata1' do
  context '#start' do

  	before(:each) do
  	  allow(File).to receive(:foreach)
      allow(Kernel).to receive(:puts)
  	end

    it 'calls glob on Dir with the default parameters and /**/*' do
      expect(Dir).to receive(:glob).with("/Users/workshare1/github/wally/lib/**/*").and_return([])
      Kata1.start "/Users/workshare1/github/wally/lib"
    end

    it 'does not read a non ruby file' do
      allow(Dir).to receive(:glob).with("/Users/workshare1/github/wally/lib/**/*") do
        ['non-ruby-file', 'file2.rb']
      end
      expect(File).not_to receive(:foreach).with('non-ruby-file')
    end

    it 'calls foreach on File for every file' do
      allow(Dir).to receive(:glob).with("/Users/workshare1/github/wally/lib/**/*") do
      	['file1.rb', 'file2.rb']
      end
      expect(File).to receive(:foreach).with('file1.rb').and_return([])
      expect(File).to receive(:foreach).with('file2.rb').and_return([])
      Kata1.start "/Users/workshare1/github/wally/lib"
    end

    it 'calls puts for every file' do
      allow(Dir).to receive(:glob).with("/Users/workshare1/github/wally/lib/**/*") do
        ['file1.rb']
      end
      allow(File).to receive(:foreach).with('file1.rb').and_return([1,2,3])
      expect(Kernel).to receive(:puts) do |file|
        expect(file).to match(/File file1.rb has 3 lines/)
      end
      Kata1.start "/Users/workshare1/github/wally/lib"
    end

    it 'calls puts for every file' do
      allow(Dir).to receive(:glob).with("/Users/workshare1/github/wally/lib/**/*") do
        ['file1.rb', 'file2.rb']
      end
      allow(File).to receive(:foreach).with('file1.rb').and_return([1,2,3])
      allow(File).to receive(:foreach).with('file2.rb').and_return([1,2,3,4])
      expect(Kernel).to receive(:puts).with('Total number of lines is 7')
      Kata1.start "/Users/workshare1/github/wally/lib"
    end
  end
end
