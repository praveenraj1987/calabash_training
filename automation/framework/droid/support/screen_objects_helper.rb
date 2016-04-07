module ScreenObjectsHelper
  include Calabash::Android::Operations
  def touch_element(locator)
    touch(locator)
  end

  def enter_text identifier, value
    touch(identifier)
    wait_for_keyboard
    keyboard_enter_text(value)
  end

  def is_element_displayed?(locator)
    query(locator).any?
  end

  def get_text_of_first_element(locator)
    query(locator, :text).first
  end

end

World(ScreenObjectsHelper)
