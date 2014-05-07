class MyView < UIView
  def initWithFrame(initWithFrame)
    super

    self.backgroundColor = UIColor.whiteColor

    # This causes a crash in RM 2.27
    when_tapped &method(:tapped)

    # This will work without failing
    # when_tapped do
    #   puts "Here"
    # end

    self
  end

  private

  def tapped(gesture)
    puts "tapped!"
  end
end
