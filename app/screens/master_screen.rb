class MasterScreen < PM::TableScreen
  title "LawPal"
  def on_load
    @table_data = [{
      cells: [
        {
          title: "Profile",
          action: :profile_tapped,
          arguments: {}
        }
      ]
    }]
  end

  def table_data
    @table_data ||= []
  end

  def profile_tapped(profile)
    print "Profile Tapped"
  end
end