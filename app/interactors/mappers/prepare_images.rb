class PrepareImages < BaseMapper
  def attribute_method_names
    %i[position size image]
  end

  private

  def model_name
    "Image"
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

  def image(json)
    new_name = write_image(json["image"]["_ref"], image_size(json["frame"]))

    { image: new_name }
  end
end
