class AppDelegate < PM::Delegate
  status_bar true, animation: :none
  attr_accessor :toolkit

  def on_load(app, options)
    # for now, we're going to skip the login screen and the matter list screen
    # instead, opening the application will take you to the ChecklistScreen
    # using this example matter:

    # instantiate Toolkit API client
    @toolkit = Toolkit.new

    matter_item_screen = MatterItemScreen.new(nav_bar: true)
    matter_item_screen.empty = true
    
    # instantiate MasterScreen
    master_screen = MasterScreen.new
    # load data into MasterScreen instance
    master_screen.matter_items = @toolkit.matter_items
    
    # display the screens
    open_split_screen master_screen, matter_item_screen
  end

end
