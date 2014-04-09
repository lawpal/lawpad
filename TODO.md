Integrate this for sliding menus:

```ruby
class AppDelegate < PM::Delegate

  def on_load(app, options)
    open_slide_menu MainScreen.new(nav_bar: true), left: LeftScreen.new(nav_bar: true), right: RightScreen.new(nav_bar: true)
  end
  
  # Docs here: http://cocoadocs.org/docsets/MMDrawerController/0.5.3/Classes/MMDrawerController.html
  
  def open_slide_menu(middle_screen, sides={})
    middle = middle_screen && middle_screen.navigationController || middle_screen
    right = sides[:right] && sides[:right].navigationController || sides[:right]
    left = sides[:left] && sides[:left].navigationController || sides[:left]
    open @mm_drawer_controller = MMDrawerController.alloc.initWithCenterViewController middle, leftDrawerViewController: left, rightDrawerViewController: right
  end
  
  # access with app_delegate.open_drawer(:left, animated: true) do ... end
  def open_drawer(side, args={}, &callback)
    args[:animated] ||= false
    # I think `side` has to be turned into MMDrawerSideLeft, MMDrawerSideRight
    side = MMDrawerSideLeft if side == :left
    side = MMDrawerSideRight if side == :right
    @mm_drawer_controller.openDrawerSide(side, animated: args[:animated], completion: &callback)
  end
  
  def close_drawer(args={}, &callback)
    args[:animated] ||= false
    @mm_drawer_controller.closeDrawerAnimated(args[:animated], completion: &callback)
  end

end

# Rakefile
# ...
Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'pm_slide_menu'
  app.device_family = :ipad
  app.pods do
    pod "MMDrawerController"
  end
end

# Gemfile
gem "motion-cocoapods"
```

Customize table cells using https://github.com/clearsightstudio/ProMotion/wiki/Reference%3A-All-available-table_data-options

Style the app with pixate.