class SecondScreen < Page
  def initialize

    @id = PageId.new(
        {
            ios:   "label marked:'You are on second screen'",
        })

    @back = Field.transition_element({
                                         :ios => "UINavigationItemButtonView"
                                     },
                                     {
                                         :to => [FirstScreen]
                                     })

    super('SecondScreen')
  end

end

PageRegistry.registerPage(SecondScreen)