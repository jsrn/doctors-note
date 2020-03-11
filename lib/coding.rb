class Coding
  CodeStruct = Struct.new(:code, :text)
  def self.random
    [
      CodeStruct.new('82272006', 'Common cold'),
      CodeStruct.new('225609009', 'Stiff legs'),
      CodeStruct.new('79859009', 'Computer programmer'),
      CodeStruct.new('25064002', 'Headache'),
      CodeStruct.new('26413003', 'Low motivation')
    ].sample
  end
end
