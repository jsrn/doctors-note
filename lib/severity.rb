class Severity
  def self.random
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