class GenerateSketch
  include Interactor::Organizer

  organize ReadJson, ParseJson, PrepareSubview, GenerateRoot, WriteXml
end
