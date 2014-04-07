class HomeScreen < PM::Screen
  title "Home"

  def on_load
    self.view.styleId = "homeScreen"


    #button =  UIButton.buttonWithType(UIButtonTypeCustom)
    #set_nav_bar_button :right, 
    #  system_icon: :add, 
    #  action: :add_matter#,
      #button: UIBarButtonItem.alloc.initWithCustomView(button)
    #set_nav_bar_button :right, {
    #  title: "Button Title"
    #}
    self.navigationItem.rightBarButtonItems = [
      UIBarButtonItem.alloc.initWithTitle("Person Smith", style: UIBarButtonItemStyleBordered, target:self, action:'push'),
      UIBarButtonItem.alloc.initWithTitle("Support", style: UIBarButtonItemStyleBordered, target:self, action:'push'),
      UIBarButtonItem.alloc.initWithTitle("Requests", style: UIBarButtonItemStyleBordered, target:self, action:'push'),
      UIBarButtonItem.alloc.initWithTitle("B", style: UIBarButtonItemStyleBordered, target:self, action:'push')
    ]

    
    @scroll = add UIScrollView.alloc.initWithFrame(self.view.bounds)

    add_to @scroll, UILabel.new
    add_to @scroll, Tile.new, { frame: [[  20,  40 ], [ 130, 130 ]] }
    add_to @scroll, Tile.new, { frame: [[ 170,  40 ], [ 130, 130 ]] }
    add_to @scroll, Tile.new, { frame: [[  20, 190 ], [ 130, 130 ]] }
    add_to @scroll, Tile.new, { frame: [[ 170, 190 ], [ 130, 130 ]] }
    add_to @scroll, Tile.new, { frame: [[  20, 340 ], [ 130, 130 ]] }
    add_to @scroll, Tile.new, { frame: [[ 170, 340 ], [ 130, 130 ]] }
  end

  def will_appear
    @scroll.frame = self.view.bounds
    @scroll.contentSize = [ @scroll.frame.size.width, content_height(@scroll) + 20 ]
  end

  def add_matter
    print "Added matter!"
  end

end
