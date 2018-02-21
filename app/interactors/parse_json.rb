require "interactor"
require "json"

class ParseJson
  include Interactor

  def call
    context.json = parse
  end

  private

  def parse
    JSON.parse(context.string_json)
  end
end
