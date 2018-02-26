class Run
  def call
    builder = GenerateRoot.call.builder
    puts builder.to_xml
  end
end
