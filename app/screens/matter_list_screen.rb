class MatterListScreen < PM::TableScreen
  title "Matters"

  def on_load
    @table_data = [{
      cells: [
        {
          title: "Matter One",
          action: :matter_tapped,
          arguments: {title:"Matter One", id:1}
        }
      ]
    }]
  end

  def table_data
    @table_data ||= []
  end

  def matter_tapped(matter)
    print "Tapped #{matter[:title]} (id:#{matter[:id]})"
  end
end