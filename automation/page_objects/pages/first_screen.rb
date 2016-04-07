class FirstScreen < Page
  def initialize

    @id = PageId.new(
        {
            ios:   "label {text BEGINSWITH 'Welcome, '}",
        })

    @firstScreenMessage = Field.element({
                               :ios   => "label marked:'You are on first screen'"
                           })
    @nextPage = Field.transition_element({
                                            :ios => "label marked:'Next Screen'"
                                          },
                                          {
                                              :to => [SecondScreen]
                                          })
    @back = Field.transition_element({
                                         :ios => "UINavigationItemButtonView"
                                     },
                                     {
                                         :to => [LoginScreen]
                                     })

    super('FirstScreen')
  end

  def goto_next_page
    @nextPage.click
  end

end

PageRegistry.registerPage(FirstScreen)