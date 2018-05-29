class View < Item
  def to_xml(xml)
    xml.imageView(defaulte_attributes) do
      xml.rect(rect_attributes)
      xml.autoresizingMask(key: "autoresizingMask", flexibleMaxX: "YES", flexibleMaxY: "YES")
    end
  end

  def defaulte_attributes
    {
      userInteractionEnabled: "NO",
      contentMode: "scaleToFill",
      horizontalHuggingPriority: "251",
      verticalHuggingPriority: "251",
      fixedFrame: "YES",
      translatesAutoresizingMaskIntoConstraint: "NO",
      id: view_id
    }
  end
end
