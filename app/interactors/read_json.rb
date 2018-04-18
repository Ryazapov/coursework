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
    @path ||= "in/0ED7D5E3-DE60-4F05-9B6E-CF69B6EFF25A.json"
  end
end
