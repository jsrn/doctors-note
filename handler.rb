require 'json'

def excuse(event:, context:)
  {
    statusCode: 200,
    body: DoctorsNote.new.condition.to_json
  }
end

class DoctorsNote
  attr_reader :observation, :severity

  def initialize
    @observation = random_observation
    @severity = random_severity
  end

  def condition
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
      onsetDateTime: Time.now.strftime('%Y-%m-%d')
    }
  end

  private

  Observation = Struct.new(:code, :text)
  def random_observation
    [
      Observation.new('82272006', 'Common cold'),
      Observation.new('225609009', 'Stiff legs'),
      Observation.new('79859009', 'Computer programmer'),
      Observation.new('25064002', 'Headache'),
      Observation.new('26413003', 'Low motivation')
    ].sample
  end

  def random_severity
    {
      system: 'http://snomed.info/sct'
    }.merge([
      {
        code: '24484000',
        display: 'Severe'
      },
      {
        code: '6736007',
        display: 'Moderate'
      },
      {
        code: '255604002',
        display: 'Mild'
      }
    ].sample)
  end
end
