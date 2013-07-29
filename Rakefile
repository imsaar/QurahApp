# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'zQurah'
  app.icons << 'icon.png'
  app.identifier = 'com.saaridev.qurah'
  app.deployment_target = "5.0"
  app.prerendered_icon = true
  
  app.development do
    app.codesign_certificate = "iPhone Developer: Syed Rizvi (8PW637K7EM)"
    app.provisioning_profile = "/Volumes/Data Drive/Dropbox/Dev/Istikhara.mobileprovision"
  end
end
