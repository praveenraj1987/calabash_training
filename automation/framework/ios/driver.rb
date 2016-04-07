require 'calabash-cucumber/operations'
require_relative '../base_driver'
require_relative 'support/screen_objects_helper'
require 'active_support/core_ext/object/blank'

class Driver < BaseDriver

  include Cucumber::RbSupport::RbWorld
  include ScreenObjectsHelper

  @@DRIVER = nil
  DRIVER_KEY = :ios

  def self.platform
    Platform::IOS
  end

  def self.get_driver
    @@DRIVER = @@DRIVER.nil? ? Driver.new : @@DRIVER
  end

  def driver_key
    DRIVER_KEY
  end

  def click(id_map)
    locator = locator_from_id_map(id_map)
    return if locator.empty?
    touch_element locator
    end

  def execute_query(id_map)
    locator = locator_from_id_map(id_map)
    query(*locator)
  end

  def exists?(id_map, wait_time)
    begin
      return false if locator_from_id_map(id_map).blank?
      element_exists locator_from_id_map(id_map)
    rescue WaitError
      false
    end
  end

  def text(id_map)
    locator = locator_from_id_map(id_map)
    get_text_of_first_element(locator)
  end

  def set_text(value, id_map)
    locator = locator_from_id_map(id_map)
    enter_text(locator, value)
  end

  def back
    begin
      touch('UINavigationItemButtonView')
    rescue Exception => e
      touch('UINavigationButton')
    rescue Exception => e
      touch("navigationItemButtonView first")
    end
    wait_for_none_animating
  end

  def alert_exists?(id_map)
    locator = locator_from_id_map(id_map)
    query(locator).count > 0 ? true : false
  end

  def touch_screen(id_map)
    touch_element(locator_from_id_map(id_map))
  end

  def acknowledge(id_map)
    touch_element(locator_from_id_map(id_map))
  end
end