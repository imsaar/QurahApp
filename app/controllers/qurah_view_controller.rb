class QurahViewController < UIViewController
  def loadView
    self.view = UIImageView.alloc.initWithImage(UIImage.imageNamed("background"))
  end

  def shouldAutorotateToInterfaceOrientation(orientation)
    orientation == UIInterfaceOrientationPortrait
  end

  def supportedInterfaceOrientations
    UIInterfaceOrientationMaskPortrait
  end

  def viewDidLoad
    super
    @label = makeIntroLabel
    view.addSubview(@label)
    view.userInteractionEnabled = true
    recognizer = UITapGestureRecognizer.alloc.initWithTarget(self, action:'doIt')
    view.addGestureRecognizer(recognizer)
  end

  def doIt
  end

  def makeIntroLabel
    label = UILabel.alloc.initWithFrame([[10, 200], [300, 120]])
    label.backgroundColor = UIColor.clearColor
    label.numberOfLines = 2
    label.text = "Qurah: Pick the Winner"
    label.font = UIFont.fontWithName(fontName, size:30)
    label.textColor = UIColor.blackColor
    label.textAlignment = UITextAlignmentCenter
    label
  end

  def fontName
    "Helvetica"
  end

end