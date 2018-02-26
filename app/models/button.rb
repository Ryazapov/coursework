class Button < ApplicationModel
  attr_accessor :title, :width, :height, :x, :y

  def to_xml(xml)
    xml.subviews do
      xml.button(defaulte_attributes) do
        xml.rect(rect_attributes)
        xml.autoresizingMask(key: "autoresizingMask", flexibleMaxX: "YES", flexibleMaxY: "YES")
        xml.state(key: "normal", title: title)
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
      id: "Ecc-1w-DHn"
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
end
