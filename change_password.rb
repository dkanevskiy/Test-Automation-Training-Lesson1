module ChangePassword

  def change_password
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'register').click

    @wait.until {@driver.find_element(:id, 'user_login').displayed?}

    @login = 'login'+rand(99999).to_s
    @password = 'Qwerty11'

    @driver.find_element(:id, 'user_login').send_keys(@login)
    @driver.find_element(:id, 'user_password').send_keys(@password)
    @driver.find_element(:id, 'user_password_confirmation').send_keys(@password)
    @driver.find_element(:id, 'user_firstname').send_keys('user_firstname')
    @driver.find_element(:id, 'user_lastname').send_keys('user_lastname')
    @driver.find_element(:id, 'user_mail').send_keys(@login + '@q.com')
    @driver.find_element(:name, 'commit').click

    @new_password = @password + '1'
    @driver.find_element(:css, ".icon.icon-passwd").click
    @driver.find_element(:css, "#password").send_keys(@password)
    @driver.find_element(:css, "#new_password").send_keys(@new_password)
    @driver.find_element(:css, "#new_password_confirmation").send_keys(@new_password)
    @driver.find_element(:xpath, "//*[@name='commit']").click
  end

end
