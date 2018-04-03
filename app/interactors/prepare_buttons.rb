class PrepareButtons
  include Interactor

  def call
    buttons = context.layer["layers"]
    search_button(buttons)
  end

  private

  def defaulte_x
    @defaulte_x ||= context.layer["frame"]["x"]
  end

  def defaulte_y
    @defaulte_y ||= context.layer["frame"]["y"]
  end

  def search_button(buttons)
    buttons.each do |button|
      context.subviews << Button.new(button_attributes(button))
    end
  end

  def button_attributes(button_json)
    {
      x: button_json["frame"]["x"] + defaulte_x,
      y: button_json["frame"]["y"] + defaulte_y,
      width: button_json["frame"]["width"],
      height: button_json["frame"]["height"],
      color: button_json["layers"][0]["style"]["fills"][0]["color"],
      title: button_json["layers"][1]["name"],
      title_color: button_json["layers"][1]["style"]["textStyle"]["encodedAttributes"]["MSAttributedStringColorDictionaryAttribute"]
    }
  end
end
