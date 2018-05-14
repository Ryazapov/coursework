class Label < Item
  attr_accessor :text, :text_color

  def to_xml(xml)
    xml.label(defaulte_attributes) do
      xml.rect(rect_attributes)
      xml.autoresizingMask(key: "autoresizingMask", flexibleMaxX: "YES", flexibleMaxY: "YES")
      xml.fontDescription(key: "fontDescription", type: "system", pointSize: "17")
      xml.color(
        key: "textColor",
        red: text_color["red"],
        green: text_color["green"],
        blue: text_color["blue"],
        alpha: text_color["alpha"],
        colorSpace: "custom",
        customColorSpace: "sRGB"
      )
    end
  end

  def defaulte_attributes
    {
      opaque: "NO",
      userInteractionEnabled: "NO",
      contentMode: "left",
      horizontalHuggingPriority: "251",
      verticalHuggingPriority: "251",
      fixedFrame: "YES",
      text: text,
      textAlignment: "natural",
      lineBreakMode: "tailTruncation",
      baselineAdjustment: "alignBaselines",
      adjustsFontSizeToFit: "NO",
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
