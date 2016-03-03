require 'spec_helper'

RSpec.describe LinesCounter do
  subject { described_class.new }

  describe '#count' do
    it 'counts the number of lines inside a directory' do
      binding.pry
      expect(subject.count('/home/mariaclrd/repos/kata1/supermaria/spec/helpers')).to eq 5
    end
  end
end