require './lib/severity'

RSpec.describe Severity, '.random' do
  it 'returns a hash' do
    expect(Severity.random).to be_a(Hash)
  end

  it 'uses the snomed coding system' do
    expect(Severity.random[:system]).to eq('http://snomed.info/sct')
  end

  it 'has a code' do
    expect(Severity.random[:code]).to_not be_nil
  end

  it 'has display text' do
    expect(Severity.random[:display]).to_not be_nil
  end
end