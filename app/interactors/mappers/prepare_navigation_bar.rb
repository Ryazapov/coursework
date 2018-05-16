class PrepareNavigationBar < BaseMapper
  def attribute_method_names
    %i[text left_item right_item size]
  end

  private

  def search_model(json)
    context.subviews << map_model.new(map_attributes(json))
  end

  def right_item(json)
    {
      right_item_text: json[1]["layers"][0]["name"],
      right_item_color: json[1]["layers"][0]["style"]["textStyle"]["encodedAttributes"]["MSAttributedStringColorDictionaryAttribute"]
    }
  end

  def text(json)
    {
      text: json[2]["layers"][0]["name"],
      bar_tint_color: json[2]["layers"][0]["style"]["textStyle"]["encodedAttributes"]["MSAttributedStringColorDictionaryAttribute"]
    }
  end

  def left_item(json)
    return {} unless json[3]["layers"].size == 1

    {
      left_item_text: json[3]["layers"][0]["name"],
      left_item_color: json[3]["layers"][0]["style"]["textStyle"]["encodedAttributes"]["MSAttributedStringColorDictionaryAttribute"]
    }
  end

  def size(json)
    {
      height: json[0]["frame"]["height"] - 20,
      width: json[0]["frame"]["width"]
    }
  end

  def model_name
    "NavigationBar"
  end
end
