class ReadJson
  include Interactor

  PATH = "in/sketch".freeze

  def call
    context.string_json = read
  end

  private

  def read
    Openzip.extract(context.from, PATH)

    IO.read(path)
  end

  def path
    @path ||= Dir["#{PATH}/pages/*"].first
  end
end
