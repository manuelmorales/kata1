require 'spec_helper'

describe 'Kata1' do
  it 'counts lines' do
    expect(Kata1.call './spec/fixtures').to eq 18
  end

  # it 'counts lines in .rb files' do
  #   expect(Kata1.call './spec/fixtures').to eq 9
  # end
end