class AppDelegate < PM::Delegate
  status_bar true, animation: :none
  attr_accessor :toolkit

  def on_load(app, options)
    # for now, we're going to skip the login screen and the matter list screen
    # instead, opening the application will take you to the ChecklistScreen
    # using this example matter:

    # instantiate Toolkit API client
    @toolkit = Toolkit.new

    # instantiate ChecklistScreen
    checklist_screen = ChecklistScreen.new(nav_bar:true)
    # load data into ChecklistScreen instance
    checklist_screen.matter = @toolkit.matters.first
    checklist_screen.matter_items = @toolkit.matter_items
    
    # instantiate MasterScreen
    master_screen = MasterScreen.new
    # load data into MasterScreen instance
    master_screen.matter_items = @toolkit.matter_items
    
    # display the screens
    open_split_screen master_screen, checklist_screen
  end

end
