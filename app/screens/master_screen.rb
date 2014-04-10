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
    @table_data = matter_item_sections
    @table_data.insert(0, empty_section)
  end

  def table_data
    @table_data ||= []
  end

  def checklist_item_tapped(checklist_item)
    checklist_item_screen = ChecklistItemScreen.new
    checklist_item_screen.checklist_item = {

    }
    open checklist_item_screen, in_detail: true
  end
end