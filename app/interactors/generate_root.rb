class GenerateRoot
  include Interactor

  def call
    context.builder = Nokogiri::XML::Builder.new(encoding: "UTF-8") do |xml|
      xml.document(document_attributes) do
        xml.dependencies do
          xml.plugIn(identifier: "com.apple.InterfaceBuilder.IBCocoaTouchPlugin", version: "13772")
          xml.capability(name: "Safe area layout guides", minToolsVersion: "9.0")
          xml.capability(name: "documents saved in the Xcode 8 format", minToolsVersion: "8.0")
        end
        xml.objects do
          xml.placeholder(placeholder_attributes) do
            xml.connections do
              xml.outlet(property: "view", destination: view_id, id: "sfx-zR-JGt")
            end
          end
          xml.placeholder(placeholderIdentifier: "IBFirstResponder", id: "-2", customClass: "UIResponder")
          xml.view(contentMode: "scaleToFill", id: view_id) do
            xml.rect(key: "frame", x: "0.0", y: "0.0", width: "375", height: "667")
            xml.autoresizingMask(key: "autoresizingMask", widthSizable: "YES", heightSizable: "YES")
            xml.color(color_attributes)
            xml.viewLayoutGuide(key: "safeArea", id: "vUN-kp-3ea")
            GenerateSubview.call(xml: xml)
          end
        end
      end
    end
  end

  private

  def document_attributes
    {
      type: "com.apple.InterfaceBuilder3.CocoaTouch.XIB",
      version: "3.0",
      toolsVersion: "13771",
      targetRuntime: "iOS.CocoaTouch",
      propertyAccessControl: "none",
      useAutolayout: "YES",
      useTraitCollections: "YES",
      useSafeAreas: "YES",
      colorMatched: "YES"
    }
  end

  def placeholder_attributes
    {
      placeholderIdentifier: "IBFilesOwner",
      id: "-1",
      userLabel: "File's Owner",
      customClass: "ViewController",
      customModuleProvider: "target"
    }
  end

  def color_attributes
    {
      key: "backgroundColor",
      red: "1",
      green: "1",
      blue: "1",
      alpha: "1",
      colorSpace: "custom",
      customColorSpace: "sRGB"
    }
  end

  def view_id
    @view_id ||= SecureRandom.uuid
  end
end
