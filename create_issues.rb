module CreateIssues

  def create_issues
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
    @wait.until {@driver.find_element(:css, ".icon.icon-add").displayed?}
    @driver.find_element(:css, ".icon.icon-add").click
    @project_name = 'Project' + rand(9999).to_s
    @driver.find_element(:css, "#project_name").send_keys(@project_name)
    @driver.find_element(:xpath, ".//*[@id='new_project']/input[@name='commit']").click

    @issue1_subject = 'subject' + rand(99999).to_s
    @issue2_subject = 'subject' + rand(99999).to_s
    @issue3_subject = 'subject' + rand(99999).to_s

    #normal_priority - default
    @driver.find_element(:css, ".new-issue").click
    @wait.until {@driver.find_element(:css, "#issue_subject").displayed?}
    @driver.find_element(:css, "#issue_subject").send_keys(@issue1_subject)
    @driver.find_element(:xpath, ".//*[@id='issue-form']/input[@value='Create']").click

    #high_priority
    @driver.find_element(:css, ".new-issue").click
    @wait.until {@driver.find_element(:css, "#issue_subject").displayed?}
    @driver.find_element(:css, "#issue_subject").send_keys(@issue2_subject)
    @driver.find_element(:css, "#issue_priority_id").click
    @driver.find_element(:xpath, ".//*[@id='issue_priority_id']/option[@value='5']").click
    @driver.find_element(:xpath, ".//*[@id='issue-form']/input[@value='Create']").click
    @driver.find_element(:xpath, ".//*[@id='issue-form']/input[@value='Create']").click

    #immediate_priority
    @driver.find_element(:css, ".new-issue").click
    @wait.until {@driver.find_element(:css, "#issue_subject").displayed?}
    @driver.find_element(:css, "#issue_subject").send_keys(@issue3_subject)
    @driver.find_element(:css, "#issue_priority_id").click
    @driver.find_element(:xpath, ".//*[@id='issue_priority_id']/option[@value='6']").click
    @driver.find_element(:xpath, ".//*[@id='issue-form']/input[@value='Create']").click
    @driver.find_element(:xpath, ".//*[@id='issue-form']/input[@value='Create']").click

    @wait.until {@driver.find_element(:css, ".issues.selected").displayed?}
    @driver.find_element(:css, ".issues.selected").click
  end

end
