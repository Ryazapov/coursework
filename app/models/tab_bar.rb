class TabBar < Label
  attr_accessor :items

  def to_xml(xml)
    xml.tabBar(defaulte_attributes) do
      xml.rect(rect_attributes)
      xml.autoresizingMask(key: "autoresizingMask", widthSizable: "YES", flexibleMaxY: "YES")
      # xml.color(color_attributes(bar_tint_color).merge(key: "barTintColor"))
      xml.items do
        items.each do |item|
          xml.tabBarItem(title: item[:text], id: generate_view_id)
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
end




# <tabBar contentMode="scaleToFill" fixedFrame="YES" translatesAutoresizingMaskIntoConstraints="NO" id="Pj8-bH-tqe">
#     <rect key="frame" x="1" y="519" width="320" height="49"/>
#     <autoresizingMask key="autoresizingMask" widthSizable="YES" flexibleMinY="YES"/>
#     <color key="backgroundColor" white="0.0" alpha="0.0" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
#     <items>
#         <tabBarItem systemItem="favorites" id="GD1-Sz-opl"/>
#         <tabBarItem systemItem="more" id="H2k-9K-cxg"/>
#         <tabBarItem title="Hello World" image="106678_pause_512x512" id="gjj-eM-gNZ"/>
#     </items>
# </tabBar>
