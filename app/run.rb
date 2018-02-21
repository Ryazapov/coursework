require "./app/interactors/generate_sketch"

class Run
  def call
    p GeneateSketch.call.json
  end

  private

  def generate_xml
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.root do
        xml.products do
          xml.widget do
            xml.id_ "10"
            xml.name "Awesome widget"
          end
        end
      end
    end

    puts builder.to_xml
  end
end
