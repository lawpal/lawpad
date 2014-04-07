lawpad
======

iPad App - rubymotion

## Which files are important?

Most app logic is in the `app` folder.

The entry point to the application is `app/app_delegate.rb`.

In addition, this application uses the `ProMotion` gem, which abstracts iOS `UIView` objects into `screens`. The highest level screen in the object hierarchy is `PM::Screen`, but there are purpose-built subclasses such as `PM::TableScreen` (corresponds to iOS's `UITableView`).

`PM::Screen` objects abstract iOS's verbose callbacks. For many, the key callback will be `on_load`. Example:

```ruby
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
    # could call something like:
    # open MatterDetailScreen.new(matter_id: matter[:id], modal: true)
  end
end
```


