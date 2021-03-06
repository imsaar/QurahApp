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
    label = makeIntroLabel
    view.addSubview(label)
    view.userInteractionEnabled = true
    recognizer = UITapGestureRecognizer.alloc.initWithTarget(self, action:'doIt')
    view.addGestureRecognizer(recognizer)
  end

  # TODO: Remove after refactor
  def viewWillAppear(animated)
    super
    becomeFirstResponder
  end

  def viewWillDisappear(animated)
    super
    resignFirstResponder
  end

  def canBecomeFirstResponder
    true
  end
  # END OF TODO: Remove after refactor

  def switchToViewMode
    @inputTextField.resignFirstResponder
  end

  def doIt
    self.view = EntryView.new
    recognizer = UITapGestureRecognizer.alloc.initWithTarget(self, action:'switchToViewMode')
    view.addGestureRecognizer(recognizer)

    view.userInteractionEnabled = true
    @items = []

    createInputField
    @listView = self.view
  end

  def createInputField
    x = 25
    y = 50
    width = 270
    height = 40

    @inputTextField = UITextField.alloc.initWithFrame(CGRectMake(x,y,width,height))
    #@inputTextField.layer.borderWidth = 1.0
    @inputTextField.clearButtonMode = UITextFieldViewModeWhileEditing
    @inputTextField.textAlignment = NSTextAlignmentLeft
    @inputTextField.font = UIFont.fontWithName(fontName, size:25)
    @inputTextField.placeholder = "Add New Entry"
    @inputTextField.enabled = true
    paddingView = UIView.alloc.initWithFrame([[0, 0], [5, 20]])
    @inputTextField.leftView = paddingView
    @inputTextField.leftViewMode = UITextFieldViewModeAlways
    @inputTextField.delegate = self
    view.addSubview(@inputTextField)
  end

  def textFieldShouldReturn(textField)
    addItem
    true
  end

  def motionEnded(motion, withEvent:event)
    if event.subtype == UIEventSubtypeMotionShake
      self.view = UIImageView.alloc.initWithImage(UIImage.imageNamed("background"))
      view.userInteractionEnabled = true

      width = 200
      height = 70
      x = 40
      y = 200

      label = UILabel.alloc.initWithFrame([[x, y], [width, height]])
      label.backgroundColor = UIColor.clearColor
      label.numberOfLines = 1
      label.font = UIFont.fontWithName(fontName, size:30)
      label.textColor = UIColor.redColor
      label.textAlignment = UITextAlignmentCenter
      label.text = @items.sample
      self.view.addSubview(label)

      button_x = 20
      button_y = 400
      button_width = 100
      button_height = 40

      frame = [[button_x, button_y], [button_width, button_height]]
      self.view.addSubview button("Back To List", "backToListView", frame)
    end
    super
  end

  def backToListView
    self.view = @listView
  end

  def addItem
    return if @inputTextField.text.strip == ""
    @items.push(@inputTextField.text)
    displayItem(@items[-1], @items.size)
    @inputTextField.text = ""
    @listView = self.view
  end

  def displayItem(item, position)
    # TODO : Create and use a TextView to display this list
    # so that it is scrollable
    width = 200
    height = 40
    x = 25
    y = 80 + (position * height)
    
    label = UILabel.alloc.initWithFrame([[x, y], [width, height]])
    label.backgroundColor = UIColor.clearColor
    label.numberOfLines = 1
    label.font = UIFont.fontWithName(fontName, size:25)
    label.textColor = UIColor.blackColor
    label.textAlignment = UITextAlignmentLeft
    label.text = "#{position}. #{item}"
    self.view.addSubview(label)
  end

  def makeIntroLabel
    label = UILabel.alloc.initWithFrame([[10, 200], [300, 120]])
    label.backgroundColor = UIColor.clearColor
    label.numberOfLines = 3
    label.text = "Qurah: Pick the Winner"
    label.font = UIFont.fontWithName(fontName, size:30)
    label.textColor = UIColor.blackColor
    label.textAlignment = UITextAlignmentCenter
    label
  end

  def button(title, action, frame)
    button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    button.layer.backgroundColor = UIColor.clearColor
    button.setTitle(title, forState:UIControlStateNormal)
    button.addTarget(self, action:action, forControlEvents:UIControlEventTouchUpInside)
    button.frame = frame
    button
  end

  def fontName
    "MarkerFelt-Wide"
  end

end