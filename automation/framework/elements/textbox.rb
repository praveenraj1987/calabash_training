require 'pry'
class Textbox < Element
	def initialize(id_map)
		super(id_map)
	end
	def set_text(value, *locator_params)
		@driver.set_text(value, interpolate_locators_with_params(*locator_params))
	end

	def set_text_and_hide_keyboard(value, *locator_params)
		@driver.set_text(value, interpolate_locators_with_params(*locator_params))
	end
end