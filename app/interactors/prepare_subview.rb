class PrepareSubview
  include Interactor

  def call
    context.subviews = []

    layers = context.json["layers"].first["layers"]
    layers.each do |layer|
      context.layer = layer
      Object.const_get("Prepare#{layer['name']}").call(context)
    end
  end
end
