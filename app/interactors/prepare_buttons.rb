class PrepareButtons
  include Interactor

  def call
    buttons = context.json
    while(buttons["name"] != "Buttons") do
      buttons = buttons["layers"].first
    end
    search_button(buttons["layers"])
  end

  private

  def search_button(buttons)
    buttons.each do |button|
      context.subviews << Button.new(button_attrebutes(button))
    end
  end

  def button_attrebutes(button_json)
    {
      x: button_json["frame"]["x"],
      y: button_json["frame"]["y"],
      width: button_json["frame"]["width"],
      height: button_json["frame"]["height"],
      title: button_json["overrideValues"].first["value"]
    }
  end
end