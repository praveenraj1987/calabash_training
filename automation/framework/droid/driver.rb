require 'calabash-android/operations'
require_relative 'support/screen_objects_helper.rb'
require_relative '../base_driver'
class Driver < BaseDriver
  include ScreenObjectsHelper
  include Calabash::Android::Operations
  @@DRIVER = nil
  DRIVER_KEY = :droid

  def self.platform
    Platform::ANDROID
  end

  def self.get_driver
    @@DRIVER = @@DRIVER.nil? ? Driver.new : @@DRIVER
  end

  def driver_key
    DRIVER_KEY
  end

  def wait_while_present(id_map, opts)
    wait_for_element_does_not_exist(locator_from_id_map(id_map), opts)
  end

  def click(id_map)
    locator = locator_from_id_map(id_map)
    return if locator.empty?
    touch_element locator
  end


  def exists?(id_map, wait_time)
    begin
      return false if locator_from_id_map(id_map).blank?
      element_exists locator_from_id_map(id_map)
    rescue WaitError
      false
    end
  end

  def set_text(value, id_map)
    locator = locator_from_id_map(id_map)
    enter_text(locator, value)
  end

  def back
    press_back_button
    sleep(0.3)
  end

  def alert_exists?(id_map)
    element_exists locator_from_id_map(id_map)
  end

  def acknowledge(id_map)
    touch_element(locator_from_id_map(id_map))
  end

  def touch_screen(id_map)
    touch_element(locator_from_id_map(id_map))
  end

end
