class AppDelegate < PM::Delegate
  status_bar true, animation: :none

  def on_load(app, options)
    open_slide_menu MatterListScreen.new(nav_bar: true), left: MasterScreen.new(nav_bar: true)
  end

end
