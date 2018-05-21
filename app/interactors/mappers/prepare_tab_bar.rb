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
    json.each do |element|
      next unless element["name"].include?("Item")
      items << bar_item(element)
    end
    { items: items }
  end

  def bar_item(json)
    image = json["layers"][1]["image"] ? { image: json["layers"][1]["image"]["_ref"] } : {}

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

  def position(json)
    item = {}
    json.each do |element|
      next unless element["name"] == "Bar"
      item = {
        x: 0,
        y: element["frame"]["y"]
      }
    end

    item
  end

  def model_name
    "TabBar"
  end

  def text_color_style(json)
    json["layers"][0]["style"]["textStyle"]["encodedAttributes"]["MSAttributedStringColorDictionaryAttribute"]
  end
end
