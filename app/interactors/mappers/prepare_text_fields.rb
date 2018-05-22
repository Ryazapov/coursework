class PrepareTextFields < BaseMapper
  def attribute_method_names
    %i[position size background text]
  end

  protected

  def model_name
    "TextField"
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
      next unless element["name"] == "Field"
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
      next unless element["name"] != "Field"
      item = {
        text: element["name"],
        text_color: element["style"]["textStyle"]["encodedAttributes"]["MSAttributedStringColorAttribute"]
      }
    end

    item
  end
end
