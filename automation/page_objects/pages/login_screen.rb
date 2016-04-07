class LoginScreen < Page
  def initialize

    @id = PageId.new(
        {
            :ios => "label marked:'login'",
            :droid => "label marked:'login'"
        })

    @username = Field.textbox({
                                  :ios   => "label marked:'UserName'",
                                  :droid => "* id:'UserName'",
                                  :web => 'css://id*'
                              })
    @password = Field.textbox({
                                  :ios   => "label marked:'Password'",
                                  :droid => "* id:'Password'",
                                  :web => ''
                              })

    @login = Field.transition_element({
                                        :ios   => "label marked:'login'",
                                        :droid => "* id:'login'",
                                        :web => ''
                                      },
                                      {
                                          :to => [LoginScreen, FirstScreen]
                                      })
    @error_dialog = Field.dialog({
                                  :ios => "view:'_UIAlertControllerView'  marked:'Sorry...'",
                                  :droid => '',
                                  :web => ''
                                 },
                                  {
                                      :ok => {
                                            :ios => "view:'_UIAlertControllerActionView'  marked:'Cancel'",
                                            :droid => '',
                                            :web => ''
                                      }
                                  })
    super('Login')
  end

  def login(user_name, password)
    @username.set_text_and_hide_keyboard user_name
    @password.set_text_and_hide_keyboard password
    @login.click
  end

  def error_dialog_is_shown
    @error_dialog.is_shown?
  end

  def dismiss_error_dialog
    transitions = { to: [LoginScreen] }
    @error_dialog.acknowledge transitions
  end

end

PageRegistry.registerPage(LoginScreen)