class PrepareButtons < BaseMapper
  def attribute_method_names
    %i[position size background text]
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
    {
      background_color: json["layers"][0]["style"]["fills"][0]["color"],
      corner_radius: json["layers"][0]["layers"][0]["fixedRadius"]
    }
  end

  def text(json)
    {
      text: json["layers"][1]["name"],
      text_color: json["layers"][1]["style"]["textStyle"]["encodedAttributes"]["MSAttributedStringColorAttribute"]
    }
  end
end
