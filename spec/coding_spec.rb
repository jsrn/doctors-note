require './lib/coding'

RSpec.describe Coding, '.random' do
  it 'returns a struct' do
    expect(Coding.random).to be_a(Coding::CodeStruct)
  end

  it 'returns an object that responds to #code' do
    expect(Coding.random).to respond_to(:code)
  end

  it 'returns an object that responds to #text' do
    expect(Coding.random).to respond_to(:text)
  end
end
