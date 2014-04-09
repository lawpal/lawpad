class MasterScreen < PM::GroupedTableScreen
  title "LawPal"
  def on_load
    @table_data = [
      {
        title: false,
        cells: []
      },
      {
        title: "Uncategorized",
        cells: [
          {
            title: "New Item",
            action: :new_item_tapped,
            arguments: {}
          },
          {
            title: "Add Category",
            action: :add_category_tapped,
            arguments: {}
          },
          {
            title: "Checklist Item One",
            action: :checklist_item_tapped,
            arguments: {}
          }
        ]
      },
      {
        title: "My Category 1",
        cells: [
          {
            title: "New Item",
            action: :new_item_tapped,
            arguments: {}
          },
          {
            title: "Edit Category",
            action: :add_category_tapped,
            arguments: {}
          },
          {
            title: "Delete Category",
            acttion: :delete_category_tapped,
            arguments: {}
          },
          {
            title: "Checklist Item Two",
            action: :checklist_item_tapped,
            arguments: {}
          },
          {
            title: "Checklist Item Three",
            action: :checklist_item_tapped,
            arguments: {}
          }
        ]  
      },
      {
        title: "My Category 2",
        cells: [
          {
            title: "TODO: Use exanding cell accessories"
          },
          {
            title: "Checklist Item Four",
            action: :checklist_item_tapped,
            arguments: {}
          },
          {
            title: "Checklist Item Five",
            action: :checklist_item_tapped,
            arguments: {}
          }
        ]  
      }
    ]
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