class GenerateRoot
  include Interactor

  def call
    context.builder = Nokogiri::XML::Builder.new(encoding: "UTF-8") do |xml|
      context.xml = xml
      xml.document(document_attributes) do
        build_device(xml)
        build_dependencies(xml)
        build_objects(xml)
        build_resources(xml)
      end
    end
  end

  private

  def build_device(xml)
    xml.device(id: "retina4_0", orientation: "portrait") do
      xml.adaptation(id: "fullscreen")
    end
  end

  def build_dependencies(xml)
    xml.dependencies do
      xml.plugIn(identifier: "com.apple.InterfaceBuilder.IBCocoaTouchPlugin", version: "13772")
      xml.capability(name: "Safe area layout guides", minToolsVersion: "9.0")
      xml.capability(name: "documents saved in the Xcode 8 format", minToolsVersion: "8.0")
    end
  end

  def build_objects(xml)
    xml.objects do
      xml.placeholder(placeholder_attributes) do
        xml.connections do
          xml.outlet(property: "view", destination: view_id, id: "sfx-zR-JGt")
        end
      end
      xml.placeholder(placeholderIdentifier: "IBFirstResponder", id: "-2", customClass: "UIResponder")
      build_view(xml)
    end
  end

  def build_view(xml)
    xml.view(contentMode: "scaleToFill", id: view_id) do
      xml.rect(key: "frame", x: "0.0", y: "0.0", width: "320", height: "568")
      xml.autoresizingMask(key: "autoresizingMask", widthSizable: "YES", heightSizable: "YES")
      xml.color(color_attributes)
      xml.viewLayoutGuide(key: "safeArea", id: "vUN-kp-3ea")
      xml.subviews do
        GenerateSubview.call(context)
      end
    end
  end

  def build_resources(xml)
    xml.resources do
      Dir["#{context.to}/images/*"].each do |file|
        xml.image(name: file_path(file), width: 36, height: 36)
      end
    end
  end

  def document_attributes
    {
      type: "com.apple.InterfaceBuilder3.CocoaTouch.XIB",
      version: "3.0",
      toolsVersion: "14109",
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

  def file_path(file)
    File.basename(file)
  end

  def view_id
    @view_id ||= SecureRandom.uuid
  end
end
