require 'calabash-android/cucumber'

require 'calabash-android/wait_helpers'
require 'calabash-android/operations'
World(Calabash::Android::Operations)

$PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '../../..'))
Dir["#{$PROJECT_ROOT}/framework/droid/*.rb"].each { |f| require(f) }

Dir["#{$PROJECT_ROOT}/framework/*.rb"].each { |f| require(f) }
require "#{$PROJECT_ROOT}/page_objects/pages/page.rb"
Dir["#{$PROJECT_ROOT}/page_objects/pages/**/*.rb"].each { |f| require(f) }
require "#{$PROJECT_ROOT}/page_objects/app/app.rb"
Dir["#{$PROJECT_ROOT}/features/steps/**/*.rb"].each { |f| require(f) }
Dir["#{$PROJECT_ROOT}/framework/elements/*.rb"].each { |f| require(f) }
