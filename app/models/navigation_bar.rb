class NavigationBar < Item
  def to_xml(xml)
  end

  def view_id
    @view_id ||= SecureRandom.uuid
  end
end
