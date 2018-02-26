class GenerateSubview
  include Interactor

  def call
    b = Button.new(title: "Hello World", height: 50, width: 295, x: 0, y: 0)

    b.to_xml(context.xml)
  end

  private

end
