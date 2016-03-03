require_relative 'spec_helper'

RSpec.describe Loc do
  subject { Loc.new.tap { |s| s.output = output } }
  let(:output) { StringIO.new }

  describe '.for_dir' do
    it 'works' do
      subject.for_dir('spec/assets/basic_example')
      output.rewind
      expect(output.read).to match(/9 lines/)
    end
  end
end
