# Requiring this file will import:
# * the Calabash Cucumber API,
# * the Calabash Cucumber predefined Steps,
# * and the Calabash::Formatters::Html cucumber formatter.
# require "calabash-cucumber/cucumber"

# To use Calabash without the predefined Calabash Steps, uncomment these
# three lines and delete the require above.
require "calabash-cucumber/wait_helpers"
require "calabash-cucumber/operations"
World(Calabash::Cucumber::Operations)

$PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '../../..'))
Dir["#{$PROJECT_ROOT}/framework/ios/*.rb"].each { |f| require(f) }

Dir["#{$PROJECT_ROOT}/framework/*.rb"].each { |f| require(f) }
require "#{$PROJECT_ROOT}/page_objects/pages/page.rb"
Dir["#{$PROJECT_ROOT}/page_objects/pages/**/*.rb"].each { |f| require(f) }
require "#{$PROJECT_ROOT}/page_objects/app/app.rb"
Dir["#{$PROJECT_ROOT}/features/steps/**/*.rb"].each { |f| require(f) }
Dir["#{$PROJECT_ROOT}/framework/elements/*.rb"].each { |f| require(f) }

ENV['APP_BUNDLE_PATH']='../TrainingCalabash/Build/Products/Calabash-iphonesimulator/TrainingCalabash.app'
ENV['DEVICE_TARGET']='iPhone 6 (9.2)'
