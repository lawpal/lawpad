class MasterScreen < PM::GroupedTableScreen
  title "LawPal"
  attr_accessor :matter_items

  def matter_item_categories
    categories = @matter_items.map do |mi|
      mi[:category]
    end

    # remove "Uncategorized"
    categories.delete("Uncategorized")
    # re-insert "Uncategorized" so that it is first
    categories.insert(0, "Uncategorized")

    categories.uniq!

    categories
  end

  def matter_item_to_cell(matter_item)
    {
      title: matter_item[:name],
      action: :matter_item_tapped,
      arguments: matter_item
    }
  end

  def matter_item_sections
    matter_item_categories.map do |category|
      {
        title: category,
        cells: @matter_items.select {|i| i[:category] == category}.map {|i| matter_item_to_cell(i)}
      }
    end
  end

  def empty_section
    {
      title: false,
      cells: []
    }
  end

  def on_load
    p matter_item_categories
    @table_data = matter_item_sections
    @table_data.insert(0, empty_section)
  end

  def table_data
    @table_data ||= []
  end

  def matter_item_tapped(matter_item)
    matter_item_screen = MatterItemScreen.new(nav_bar: true)
    matter_item_screen.title = matter_item[:name]
    matter_item_screen.matter_item = matter_item
    
    open matter_item_screen, in_detail: true
  end
end