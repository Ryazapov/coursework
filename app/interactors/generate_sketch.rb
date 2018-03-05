class GenerateSketch
  include Interactor::Organizer

  organize ReadJson, ParseJson, GenerateRoot, WriteXml
end
