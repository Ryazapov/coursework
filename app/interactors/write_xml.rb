class WriteXml
  include Interactor

  def call
    File.write(path, xml)
  end

  private

  def xml
    @xml ||= context.builder.to_xml
  end

  def path
    @path ||= "out/out.xib"
  end
end
