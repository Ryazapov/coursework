class Run
  def call
    generate_xml
  end

  private

  def generate_xml
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.root {
        xml.products {
          xml.widget {
            xml.id_ "10"
            xml.name "Awesome widget"
          }
        }
      }
    end

    puts builder.to_xml
  end
end
