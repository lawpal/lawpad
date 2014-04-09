lawpad
======

iPad App - rubymotion

# RubyMotion Basics

Skim: http://www.rubymotion.com/ and http://www.rubymotion.com/developer-center/guides/getting-started/

RubyMotion has two components:

1. A flavor of Ruby that compiles to the same byte code as Objective-C
2. A build system for RubyMotion code

## Ruby Syntax

RubyMotion provides native access to all classes and frameworks available in iOS. This works out quite well because Ruby and Objective-C are semantically very similar.

For example, this Objective-C code:

```objective-c
[string drawAtPoint:point withFont:font];
```

can easily be translated to RubyMotion:


```ruby
string.drawAtPoint(point, withFont:font)
```

In Objective-C, objects are typically instantiated using `MyObject.alloc.init`, whereas with Ruby, we use `MyObject.new`. The convention is classes written in RubyMotion use the `::new` method. You can even use it to wrap an Objective-C class:

```ruby
class MyClass < UIView
  def self.new
    uiv = self.alloc.init
    uiv
  end
end

mc = MyClass.new
```

## Build System and Package Managers

RubyMotion does a good job of bringing Ruby build practices to the iOs world. This means we get to use `Rakefile`s and `Gemfile`s.

To test the app locally, just run `rake` and it the iOs simulator will fire up. CMD+Click on any part of the screen and that view becomes `self` inside of the REPL in the terminal.

Application settings, such as device family, are set in the `Rakefile`.

Though RubyMotion uses bundler, gems must be specifically built for RubyMotion. In other words, RubyMotion gives you Ruby's package manager for free, but not the packages themselves. That's ok, though, as there are many popular RubyMotion gems.

RubyMotion also allows you to use CocoaPods, with the `motion-cocoapods` gem. This allows you to define Cocoapods dependencies inside of the `Rakefile`. This works quite well, but mixing 3rd party Objective-C libraries into a RubyMotion project has been dicey/buggy sometimes. 

# iOS Basics

The entry point for an iOS app is the `AppDelegate`. Here's a complete iOS app with RubyMotion:

```ruby
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    alert = UIAlertView.new
    alert.message = "Hello World!"
    alert.show
    true
  end
end
```

Notice the slight variation from "normal" Ruby with the named argument `didFinishLaunchingWithOptions`. In RubyMotion, names arguments define the method signature, so

```ruby
def foo(bar, withBaz:baz); end
```

has a different method signature than

```ruby
def foo(bar, withBazLikeObject:bazLikeObject); end
```

This allows you to customize behavior based on the arguments passed to the method. More importantly, this is a key technique used by iOS classes to call callback methods. Here's an example:

```ruby
class MyView < UIViewController
  # ...
  def tableView(tableView, numberOfRowsInSection: section)
    # return the number of rows
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    end

    # put your data in the cell

    cell
  end
end
```

No need to worry about everything that's going on here, just focus on the idea that as the user interacts with the app, iOS will call specific methods that need callbacks implemented. Notice that these methods are both "named" `tableView`. It's the named arguments that differentiate. And they are used for very different purposes. Read the names aloud to get the difference.

# RubyMotion Libraries

That last example looked quite involved, and it is. Thankfully, a number of libraries have sprung up that abstract away a lot of the verbose Objective-C APIs in favor of more expressive Ruby APIs.

## ProMotion 

[ProMotion](https://github.com/clearsightstudio/ProMotion) is a gem that provides a concept of "screens". Instead of worrying about controllers and views, just think of screens. A screen is quite literally a screen that the user sees on the device. Here's a full application written using ProMotion:

```ruby
# app/app_delegate.rb
class AppDelegate < PM::Delegate
  # uses `on_load` instead of `applicationDidFinishLaunching`
  def on_load(app, options)
    open RootScreen.new(nav_bar: true) # nav_bar option avoids a lot of boilerplate
  end
end

# app/screens/root_screen.rb
class RootScreen < PM::Screen
  title "Root Screen"

  def on_load
    set_nav_bar_button :right, title: "Help", action: :open_help_screen
  end

  def open_help_screen
    open HelpScreen
  end
end

# app/screens/help_screen.rb
class HelpScreen < PM::TableScreen
  # this class means we no longer need to use that ugly `tableView:cellForRowAtIndexPath` method in the example above.
  title "Table Screen"

  def table_data
    [{
      title: "Help",
      cells: [
        { title: "About this app", action: :tapped_about },
        { title: "Log out", action: :log_out }
      ]
    }]
  end

  def tapped_about(args={})
    open AboutScreen
  end

  def log_out
    # Log out!
  end
end
```

## More Libraries

- [Motion Wrappers](http://rubymotion-wrappers.com/)
- [BubbleWrap](https://github.com/rubymotion/BubbleWrap) (Swiss army knife/utility belt. Includes things like an HTTP library and gesture recognizer)

# Further reading

Now that you've made it this far, this [site](http://rubymotion-tutorial.com/) contains a more reference-like set of tutorials including lessons on views, controllers, tables, and testing.

