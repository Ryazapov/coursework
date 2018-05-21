class PrepareNavigationBar < BaseMapper
  def attribute_method_names
    %i[text left_item right_item size]
  end

  private

  def search_model(json)
    context.subviews << map_model.new(map_attributes(json))
  end

  def right_item(json)
    item = {}
    json.each do |element|
      next unless element["name"] == "Right"
      item = {
        right_item_text: element["layers"][0]["name"],
        right_item_color: text_color_style(element)
      }
    end

    item
  end

  def text(json)
    item = {}
    json.each do |element|
      next unless element["name"] == "Center"
      item = {
        text: element["layers"][0]["name"],
        bar_tint_color: text_color_style(element)
      }
    end

    item
  end

  def left_item(json)
    item = {}
    json.each do |element|
      next unless element["name"] == "Left" && element["layers"].size == 1
      item = {
        left_item_text: element["layers"][0]["name"],
        left_item_color: text_color_style(element)
      }
    end

    item
  end

  def size(json)
    item = {}
    json.each do |element|
      next unless element["name"] == "Bar"
      item = {
        height: element["frame"]["height"] - 20,
        width: element["frame"]["width"]
      }
    end

    item
  end

  def model_name
    "NavigationBar"
  end

  def text_color_style(json)
    json["layers"][0]["style"]["textStyle"]["encodedAttributes"]["MSAttributedStringColorDictionaryAttribute"]
  end
end
