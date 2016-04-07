class Page
  attr_reader :name, :id
  def initialize(name)
    raise "@id not found for #{self.class}. PageId object is required to be defined for every page" unless @id
    @name   = name
    @driver = Driver.get_driver
  end

  def current_page?(wait=40)
    @id.exists? wait
  end

  def back
    @back.click
  end

end
