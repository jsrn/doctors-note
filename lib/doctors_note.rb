require './lib/severity'
require './lib/coding'

class DoctorsNote
  attr_reader :observation, :severity

  def initialize
    @observation = Coding.random
    @severity = Severity.random
  end

  def note
    {
      resourceType: 'Condition',
      id: 'excuse',
      text: {
        status: 'generated',
        div: "<div xmlns=\"http://www.w3.org/1999/xhtml\">#{severity[:display]} #{observation.text.downcase} (Date: #{Time.now.strftime('%e-%B %Y').strip})</div>"
      },
      clinicalStatus: {
        coding: [
          {
            system: 'http://terminology.hl7.org/CodeSystem/condition-clinical',
            code: 'active'
          }
        ]
      },
      verificationStatus: {
        coding: [
          {
            system: 'http://terminology.hl7.org/CodeSystem/condition-ver-status',
            code: 'confirmed'
          }
        ]
      },
      category: [
        {
          coding: [
            {
              system: 'http://terminology.hl7.org/CodeSystem/condition-category',
              code: 'encounter-diagnosis',
              display: 'Encounter Diagnosis'
            },
            {
              system: 'http://snomed.info/sct',
              code: '439401001',
              display: 'Diagnosis'
            }
          ]
        }
      ],
      severity: {
        coding: [severity]
      },
      code: {
        coding: [
          {
            system: 'http://snomed.info/sct',
            code: observation.code,
            display: observation.text
          }
        ],
        text: observation.text
      },
      subject: {
        reference: 'Patient/you'
      },
      onsetDateTime: Time.now.strftime('%Y-%m-%d'),
      note: [
        {
          text: "Add more conditions at https://github.com/jsrn/doctors-note"
        }
      ]
    }
  end
end