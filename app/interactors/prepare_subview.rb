class PrepareSubview
  include Interactor

  def call
    context.subviews = []
    prepare_buttons
    prepare_labels
  end

  private

  def prepare_buttons
    PrepareButtons.call(context)
  end

  def prepare_labels
    PrepareLabels.call(context)
  end
end
