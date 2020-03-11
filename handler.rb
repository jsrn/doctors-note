require 'json'
require './lib/doctors_note'

def excuse(event:, context:)
  {
    statusCode: 200,
    body: DoctorsNote.new.note.to_json
  }
end
