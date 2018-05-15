class Button < Label
  attr_accessor :background_color, :corner_radius

  def to_xml(xml)
    xml.button(defaulte_attributes) do
      xml.rect(rect_attributes)
      xml.autoresizingMask(key: "autoresizingMask", flexibleMaxX: "YES", flexibleMaxY: "YES")
      xml.color(color_attributes(background_color).merge(key: "backgroundColor"))
      xml.state(key: "normal", title: text) do
        xml.color(color_attributes(text_color).merge(key: "titleColor"))
      end
      build_runtime_attributes(xml)
    end
  end

  def build_runtime_attributes(xml)
    xml.userDefinedRuntimeAttributes do
      build_corner_radius(xml)
    end
  end

  def build_corner_radius(xml)
    xml.userDefinedRuntimeAttribute(type: "number", keyPath: "cornerRadius") do
      xml.integer(key: "value", value: corner_radius)
    end
  end

  def defaulte_attributes
    {
      opaque: "NO",
      contentMode: "scaleToFill",
      fixedFrame: "YES",
      contentHorizontalAlignment: "center",
      contentVerticalAlignment: "center",
      buttonType: "roundedRect",
      lineBreakMode: "middleTruncation",
      translatesAutoresizingMaskIntoConstraints: "NO",
      id: view_id
    }
  end
end
