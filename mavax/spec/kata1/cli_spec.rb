require 'spec_helper'

RSpec.describe Cli do
  describe '#start' do
    it 'runs app with first argument' do
      expect(App).to receive(:run).with(:potato_chimichanga)
      subject.start(:potato_chimichanga, :something_else)
    end
  end
end
