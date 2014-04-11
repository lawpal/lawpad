class MatterItemScreen < PM::Screen
  attr_accessor :matter_item, :empty

  def on_load
    #set_attributes self.view,
    #  background_color: UIColor.grayColor

    self.view.styleClass = "matterItemScreen"
  end
end