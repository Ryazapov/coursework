class Button < Item
  attr_accessor :title, :color, :title_color

  def to_xml(xml)
    xml.button(defaulte_attributes) do
      xml.rect(rect_attributes)
      xml.autoresizingMask(key: "autoresizingMask", flexibleMaxX: "YES", flexibleMaxY: "YES")
      xml.color(key: "backgroundColor", red: color["red"], green: color["green"], blue: color["blue"], alpha: color["alpha"], colorSpace: "custom", customColorSpace: "sRGB")
      xml.state(key: "normal", title: title) do
        xml.color(key: "textColor", red: title_color["red"], green: title_color["green"], blue: title_color["blue"], alpha: title_color["alpha"], colorSpace: "custom", customColorSpace: "sRGB")
      end
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
