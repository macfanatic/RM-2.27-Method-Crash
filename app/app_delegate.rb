class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    app_frame = UIScreen.mainScreen.applicationFrame
    @window = UIWindow.alloc.initWithFrame(app_frame)
    @window.rootViewController = HomeViewController.alloc.initWithNibName(nil, bundle: nil)
    @window.makeKeyAndVisible

    true
  end
end
