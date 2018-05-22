class WriteXml
  include Interactor

  def call
    create_dirs
    write_xib
    write_images
  end

  private

  def create_dirs
    Dir.mkdir(path) unless File.exist?(path)
    Dir.mkdir(images_path) unless File.exist?(images_path)
  end

  def write_xib
    File.write("#{path}/out.xib", xml)
  end

  def write_images
    Dir["in/sketch/images/*"].each do |file|
      image = MiniMagick::Image.open(file)
      image.resize "36x36"
      image.write "#{images_path}/#{File.basename(file)}"
    end
  end

  def xml
    @xml ||= context.builder.to_xml
  end

  def path
    @path ||= "#{context.to}/views"
  end

  def images_path
    @images_path ||= "#{context.to}/images"
  end
end
