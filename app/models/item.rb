class Item < ApplicationModel
  attr_accessor :width, :height, :x, :y

  protected

  def to_xml(xml)
  end
end
