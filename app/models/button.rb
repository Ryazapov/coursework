class Button < Item
  attr_accessor :title, :color, :title_color, :corner_radius

  def to_xml(xml)
    xml.button(defaulte_attributes) do
      xml.rect(rect_attributes)
      xml.autoresizingMask(key: "autoresizingMask", flexibleMaxX: "YES", flexibleMaxY: "YES")
      xml.color(key: "backgroundColor", red: color["red"], green: color["green"], blue: color["blue"], alpha: color["alpha"], colorSpace: "custom", customColorSpace: "sRGB")
      xml.state(key: "normal", title: title) do
        build_text_color(xml)
      end
      build_runtime_attributes(xml)
    end
  end

  def build_text_color(xml)
    xml.color(
      key: "titleColor",
      red: title_color["red"],
      green: title_color["green"],
      blue: title_color["blue"],
      alpha: title_color["alpha"],
      colorSpace: "custom",
      customColorSpace: "sRGB"
    )
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

  def rect_attributes
    {
      key: "frame",
      x: x,
      y: y,
      width: width,
      height: height
    }
  end

  def view_id
    @view_id ||= SecureRandom.uuid
  end
end
