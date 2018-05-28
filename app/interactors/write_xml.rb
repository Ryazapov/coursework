class WriteXml
  include Interactor

  def call
    create_dir
    write_xib
  end

  private

  def create_dir
    Dir.mkdir(path) unless File.exist?(path)
  end

  def write_xib
    File.write("#{path}/out.xib", xml)
  end

  def xml
    @xml ||= context.builder.to_xml
  end

  def path
    @path ||= "#{context.to}/views"
  end
end
