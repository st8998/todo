class Stories::Index < Mustache
  def name
    v.link_to('JOPPA DRILLER', v.stories_path)
  end

  def assigns
    self[:assigns]
  end

  def v
     self[:view]
  end

end