class GenerateSubview
  include Interactor

  def call
    context.subviews.each do |subview|
      subview.to_xml(context.xml)
    end
  end
end
