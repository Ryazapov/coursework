class PrepareLabels
  include Interactor

  def call
    labels = context.layer["layers"]
    search_label(labels)
  end

  private

  def defaulte_x
    @defaulte_x ||= context.layer["frame"]["x"]
  end

  def defaulte_y
    @defaulte_y ||= context.layer["frame"]["y"]
  end

  def search_label(labels)
    labels.each do |label|
      context.subviews << Label.new(label_attrebutes(label))
    end
  end

  def label_attrebutes(label_json)
    {
      x: label_json["frame"]["x"] + defaulte_x,
      y: label_json["frame"]["y"] + defaulte_y,
      width: label_json["frame"]["width"],
      height: label_json["frame"]["height"],
      text: label_json["name"],
      title_color: label_json["style"]["textStyle"]["encodedAttributes"]["MSAttributedStringColorDictionaryAttribute"]
    }
  end
end
