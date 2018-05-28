class BaseMapper
  include Interactor

  protected

  def call
    json = context.layer["layers"]
    search_model(json)
  end

  def search_model(json)
    json.each do |model|
      context.subviews << map_model.new(map_attributes(model))
    end
  end

  def model_name
  end

  def attribute_method_names
  end

  def defaulte_x
    @defaulte_x ||= context.layer["frame"]["x"]
  end

  def defaulte_y
    @defaulte_y ||= context.layer["frame"]["y"]
  end

  def map_model
    @map_model ||= Object.const_get(model_name)
  end

  def map_attributes(json)
    map_attributes = {}

    attribute_method_names.each do |method_name|
      attrs = send(method_name, json)
      map_attributes.merge!(attrs)
    end

    map_attributes
  end

  def write_image(path, size)
    Dir["in/sketch/images/*"].each do |file|
      next if File.basename(file, ".*") != File.basename(path, ".*")
      image = MiniMagick::Image.open(file)
      image.resize(size)
      image.write "#{images_path}/#{File.basename(file)}"
    end
  end

  def images_path
    @images_path ||= "#{context.to}/images"

    Dir.mkdir(@images_path) unless File.exist?(@images_path)

    @images_path
  end

  def image_size(frame)
    "#{frame['width']}x#{frame['height']}"
  end
end
