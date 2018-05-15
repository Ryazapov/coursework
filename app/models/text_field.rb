class TextField < Item
  attr_accessor :text, :background_color, :text_color, :corner_radius

  def to_xml(xml)
    xml.textField(defaulte_attributes) do
      xml.rect(rect_attributes)
      xml.autoresizingMask(key: "autoresizingMask", flexibleMaxX: "YES", flexibleMaxY: "YES")
      xml.color(color_attributes(background_color).merge(key: "backgroundColor"))
    end
  end

  def defaulte_attributes
    {
      opaque: "NO",
      contentMode: "scaleToFill",
      fixedFrame: "YES",
      contentHorizontalAlignment: "left",
      contentVerticalAlignment: "center",
      borderStyle: "line",
      textAlignment: "natural",
      placeholder: text,
      translatesAutoresizingMaskIntoConstraints: "NO",
      id: view_id
    }
  end
end
