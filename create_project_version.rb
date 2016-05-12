module CreateProjectVersion

  def create_project_version
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
    @driver.find_element(:css, ".projects").click
    @driver.find_element(:css, ".icon.icon-add").click
    @project_name = 'Project' + rand(9999).to_s
    @driver.find_element(:css, "#project_name").send_keys(@project_name)
    @driver.find_element(:xpath, ".//*[@id='new_project']/input[@name='commit']").click
    @driver.find_element(:id, 'tab-versions').click
    @driver.find_element(:link, 'New version').click
    @version_name = 'version'+rand(99999).to_s
    @driver.find_element(:id, 'version_name').send_keys(@version_name)
    @driver.find_element(:xpath, ".//*[@id='new_version']/input[@type='submit']").click
  end

end
