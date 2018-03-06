class PrepareLabels
  include Interactor

  def call
    labels = context.json["layers"].first["layers"][1]["layers"]
    search_button(labels)
  end

  private

  def search_button(labels)
    labels.each do |label|
      context.subviews << Label.new(labels_attrebutes(label))
    end
  end

  def labels_attrebutes(labels_json)
    {
      x: labels_json["frame"]["x"],
      y: labels_json["frame"]["y"],
      width: labels_json["frame"]["width"],
      height: labels_json["frame"]["height"],
      text: labels_json["overrideValues"].first["value"]
    }
  end
end
