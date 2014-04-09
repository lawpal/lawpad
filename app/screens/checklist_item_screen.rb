class ChecklistItemScreen < PM::GroupedTableScreen
  attr_accessor :checklist_item

def on_load
    @table_data = [
      {
        title: false,
        cells: []
      }
    ]
  end

  def table_data
    @table_data ||= []
  end
end