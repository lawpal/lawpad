class AppDelegate < PM::Delegate
  status_bar true, animation: :none

  def on_load(app, options)
    # for now, we're going to skip the login screen and the matter list screen
    # instead, opening the application will take you to the ChecklistScreen
    # using this example matter:
    checklist_screen = ChecklistScreen.new(nav_bar:true)
    checklist_screen.matter = {
      name: "LawPal (internal)", 
      client: false, 
      lawyer: "http://localhost:8000/api/v1/users/rosslawyer/", 
      participants: [
        "http://localhost:8000/api/v1/users/rossc/"
      ]
    }
    open_split_screen MasterScreen, checklist_screen
  end

end
