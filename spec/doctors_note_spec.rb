require './lib/doctors_note'
require 'fhir_models'

RSpec.describe DoctorsNote, '#note' do
  it 'returns a hash' do
    expect(DoctorsNote.new.note).to be_a(Hash)
  end

  it 'represents a valid FHIR object' do
    doctors_note = DoctorsNote.new.note
    fhir_object = FHIR::Condition.new(doctors_note)
    expect(fhir_object.valid?).to be true
  end
end
