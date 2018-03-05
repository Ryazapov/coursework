class PrepareSubview
  include Interactor

  def call
    context.subviews = []
    prepare_buttons
  end

  private

  def prepare_buttons
    PrepareButtons.call(context)
  end
end
