class Item
  include ActiveModel::Model

  attr_accessor :width, :height, :x, :y

  protected

  def to_xml(xml)
  end

  def rect_attributes
    {
      key: "frame",
      x: x,
      y: y,
      width: width,
      height: height
    }
  end

  def color_attributes(color)
    {
      red: color["red"],
      green: color["green"],
      blue: color["blue"],
      alpha: color["alpha"],
      colorSpace: "custom",
      customColorSpace: "sRGB"
    }
  end

  private

  def view_id
    @view_id ||= generate_view_id
  end

  def generate_view_id
    SecureRandom.uuid
  end
end
