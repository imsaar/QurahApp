class EntryView < UIImageView

  def init
    super
    self.initWithImage(UIImage.imageNamed("background"))
  end

end