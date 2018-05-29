class PrepareViews < BaseMapper
  def attribute_method_names
    %i[position size]
  end

  private

  def model_name
    "View"
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
end
