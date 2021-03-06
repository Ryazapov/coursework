class NavigationBar < Label
  attr_accessor :bar_tint_color, :left_item_text, :left_item_color, :right_item_text, :right_item_color

  def to_xml(xml)
    xml.navigationBar(defaulte_attributes) do
      xml.rect(rect_attributes)
      xml.autoresizingMask(key: "autoresizingMask", widthSizable: "YES", flexibleMaxY: "YES")
      xml.color(bar_tint_color)
      xml.items do
        xml.navigationItem(title: text, id: generate_view_id) do
          if left_item_text
            xml.barButtonItem(key: "leftBarButtonItem", title: left_item_text, id: generate_view_id) do
              xml.color(color_attributes(left_item_color).merge(key: "tintColor"))
            end
          end

          xml.barButtonItem(key: "rightBarButtonItem", title: right_item_text, id: generate_view_id) do
            xml.color(color_attributes(right_item_color).merge(key: "tintColor"))
          end
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
    @y ||= 20
  end

  def x
    @x ||= 0.0
  end
end
