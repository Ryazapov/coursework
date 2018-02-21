require "interactor"
require "./app/interactors/read_json"
require "./app/interactors/parse_json"

class GeneateSketch
  include Interactor::Organizer

  organize ReadJson, ParseJson
end
