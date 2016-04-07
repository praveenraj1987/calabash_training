class PageId

  attr_reader :id_map

  def initialize(id_map)
    @driver = Driver.get_driver
    @id_map = id_map
  end

  def exists? wait=40
    @driver.exists?(@id_map, wait)
  end
end
