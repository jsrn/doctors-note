require './lib/doctors_note'

RSpec.describe DoctorsNote, '#note' do
  it 'returns a hash' do
    expect(DoctorsNote.new.note).to be_a(Hash)
  end
end