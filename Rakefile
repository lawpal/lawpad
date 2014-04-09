# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require "rubygems"
require "bubble-wrap/core"
require "motion-pixatefreestyle"
require "motion-hockeyapp"
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'LawPad'
  app.device_family = [:ipad]
  app.interface_orientations = [:landscape_left, :landscape_right]
  app.pixatefreestyle.framework = 'vendor/PixateFreestyle.framework'

  app.identifier = 'com.lawpal.LawPad'
  app.codesign_certificate
  app.provisioning_profile = '/Users/adelevie/programming/lawpal/lawpad/Alans_iPad_and_iPhone.mobileprovision'

  if app.hockeyapp?
    app.hockeyapp do
      set :api_token, 'd7a862d9b38842adbb3af63dd63d519a '
      #set :beta_id, '83be1abdfb3acd29c0e012a644e71b7d'
      #set :live_id, '90a35939241bd75d785e152d37aeb25b'
      #set :status, "2"
      #set :notify, "0"
      #set :notes_type, "1"
    end
    # optional: do other config changes when in hockeyapp mode
    # app.identifier = 'com.your.App.hockeyapp'
  end

end