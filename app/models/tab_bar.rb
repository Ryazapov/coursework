class TabBar < Label
  attr_accessor :items

  def to_xml(xml)
    xml.tabBar(defaulte_attributes) do
      xml.rect(rect_attributes)
      xml.autoresizingMask(key: "autoresizingMask", widthSizable: "YES", flexibleMaxY: "YES")
      xml.items do
        items.sort_by { |i| i["text"] }.each do |item|
          xml.tabBarItem(title: item[:text], image: File.basename(item[:image]), id: generate_view_id)
        end
      end
    end
  end

  def defaulte_attributes
    {
      contentMode: "scaleToFill",
      fixedFrame: "YES",
      translatesAutoresizingMaskIntoConstraints: "NO",
      id: view_id
    }
  end

  def y
    @y ||= -height
  end
end
