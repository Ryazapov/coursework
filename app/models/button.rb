class Button < Item
  attr_accessor :title

  def to_xml(xml)
    xml.button(defaulte_attributes) do
      xml.rect(rect_attributes)
      xml.autoresizingMask(key: "autoresizingMask", flexibleMaxX: "YES", flexibleMaxY: "YES")
      xml.state(key: "normal", title: title)
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
