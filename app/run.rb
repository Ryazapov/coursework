class Run
  include Interactor

  def call
    GenerateSketch.call(context)
  end
end
