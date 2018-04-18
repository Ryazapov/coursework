class PrepareNavigationBar
  include Interactor

  def call
    context.subviews << NavigationBar.new(navigation_bar_attributes(context.layer["layers"]))
  end

  private

  def navigation_bar_attributes(navigation_bar_json)
  end
end
