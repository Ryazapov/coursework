class PrepareButtons < BaseMapper
  def attribute_method_names
    %i[position size background text image]
  end

  private

  def model_name
    "Button"
  end

  def position(json)
    {
      x: json["frame"]["x"] + defaulte_x,
      y: json["frame"]["y"] + defaulte_y
    }
  end

  def size(json)
    {
      width: json["frame"]["width"],
      height: json["frame"]["height"]
    }
  end

  def background(json)
    item = {}
    json["layers"].each do |element|
      next unless element["name"] == "Background"
      item = {
        background_color: element["style"]["fills"][0]["color"],
        corner_radius: element["layers"][0]["fixedRadius"]
      }
    end

    item
  end

  def text(json)
    item = {}
    json["layers"].each do |element|
      next if %w[Background Image].include?(element["name"])
      item = {
        text: element["name"],
        text_color: element["style"]["textStyle"]["encodedAttributes"]["MSAttributedStringColorAttribute"] ||
                    element["style"]["textStyle"]["encodedAttributes"]["MSAttributedStringColorDictionaryAttribute"]
      }
    end

    item
  end

  def image(json)
    item = {}
    json["layers"].each do |element|
      next unless element["name"] == "Image"
      item = { image: File.basename(element["image"]["_ref"]) }
    end

    item
  end
end
