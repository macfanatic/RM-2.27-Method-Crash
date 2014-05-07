class HomeViewController < UIViewController
  def loadView
    self.view = MyView.alloc.initWithFrame [[0,0], [320,480]]
  end
end
