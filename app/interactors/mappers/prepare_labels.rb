class PrepareLabels < BaseMapper
  def attribute_method_names
    %i[position size text]
  end

  private

  def model_name
    "Label"
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

  def text(json)
    {
      text: json["name"],
      text_color: json["style"]["textStyle"]["encodedAttributes"]["MSAttributedStringColorDictionaryAttribute"]
    }
  end
end
