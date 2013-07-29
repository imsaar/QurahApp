class EntryViewController < UIViewController
  def shouldAutorotateToInterfaceOrientation(orientation)
    orientation == UIInterfaceOrientationPortrait
  end

  def supportedInterfaceOrientations
    UIInterfaceOrientationMaskPortrait
  end

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

  def viewDidLoad
    super
    self.view = EntryView.new
    recognizer = UITapGestureRecognizer.alloc.initWithTarget(self, action:'switchToViewMode')
    view.addGestureRecognizer(recognizer)
    view.userInteractionEnabled = true
    @items = []
  end
end