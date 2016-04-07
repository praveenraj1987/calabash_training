class Dialog < Element
	attr_accessor :title, :body, :buttons
	OK_BUTTON = "* marked:'OK'"

	def initialize(id, buttons)
		@id_map        = id
		@ok_button     = buttons[:ok]
		@cancel_button = buttons[:cancel] if buttons[:cancel]!=nil
		super(@id_map)
	end

	def is_shown?
		@driver.alert_exists? @id_map
	end

	def acknowledge(transitions)
		@driver.acknowledge @ok_button
		transition(transitions)
	end

end
