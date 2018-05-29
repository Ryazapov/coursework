class PrepareTabBar < BaseMapper
  def attribute_method_names
    %i[items size position]
  end

  private

  def search_model(json)
    context.subviews << map_model.new(map_attributes(json))
  end

  def items(json)
    items = []
    json.sort_by { |i| i["name"] }.each do |element|
      next unless element["name"].include?("Item")
      items << bar_item(element)
    end
    { items: items }
  end

  def bar_item(json)
    layer = json["layers"][1]
    image = {}
    if layer
      new_name = write_image(layer["image"]["_ref"], image_size(layer["frame"]))

      image = { image: new_name }
    end

    { text: json["layers"][0]["name"] }.merge(image)
  end

  def size(json)
    item = {}
    json.each do |element|
      next unless element["name"] == "Bar"
      item = {
        height: element["frame"]["height"],
        width: element["frame"]["width"]
      }
    end

    item
  end

  def position(_json)
    {
      x: context.layer["frame"]["x"],
      y: context.layer["frame"]["y"]
    }
  end

  def model_name
    "TabBar"
  end

  def text_color_style(json)
    json["layers"][0]["style"]["textStyle"]["encodedAttributes"]["MSAttributedStringColorDictionaryAttribute"]
  end
end
