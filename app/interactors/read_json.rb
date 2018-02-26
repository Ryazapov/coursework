class ReadJson
  include Interactor

  def call
    context.string_json = read
  end

  private

  def read
    IO.read(path)
  end

  def path
    @path ||= "in/A5030B91-2998-4338-B2CC-E9CAFC1DE2BE.json"
  end
end
