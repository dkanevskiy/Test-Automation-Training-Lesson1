module HelperMethods

  def add_user
    create_project

    @driver.find_element(:css, "#tab-members").click
    @driver.find_element(:css, ".user.active").click
    @driver.find_element(:css, ".home").click
    @driver.find_element(:link, "#{@project_name}").click
  end

  def change_password
    register_user

    @new_password = @password + '1'
    @driver.find_element(:css, ".icon.icon-passwd").click
    @driver.find_element(:css, "#password").send_keys(@password)
    @driver.find_element(:css, "#new_password").send_keys(@new_password)
    @driver.find_element(:css, "#new_password_confirmation").send_keys(@new_password)
    @driver.find_element(:xpath, "//*[@name='commit']").click
  end

  def create_issues
    create_project

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

  def create_project
    register_user

    @driver.find_element(:css, ".projects").click
    @driver.find_element(:css, ".icon.icon-add").click
    @project_name = 'Project' + rand(9999).to_s
    @driver.find_element(:css, "#project_name").send_keys(@project_name)
    @driver.find_element(:xpath, ".//*[@id='new_project']/input[@name='commit']").click
  end

  def create_project_version
    create_project

    @driver.find_element(:id, 'tab-versions').click
    @driver.find_element(:link, 'New version').click
    @version_name = 'version'+rand(99999).to_s
    @driver.find_element(:id, 'version_name').send_keys(@version_name)
    @driver.find_element(:xpath, ".//*[@id='new_version']/input[@type='submit']").click
  end


  def edit_user
    register_user

    @driver.find_element(:css, ".projects").click
    @driver.find_element(:css, ".icon.icon-add").click
    @project_name = 'Project' + rand(9999).to_s
    @driver.find_element(:css, "#project_name").send_keys(@project_name)
    @driver.find_element(:xpath, ".//*[@id='new_project']/input[@name='commit']").click
    @driver.find_element(:css, "#tab-members").click
    @driver.find_element(:css, ".icon.icon-edit").click
    @driver.find_element(:xpath, "*//input[@value='4'][@type='checkbox']").click
    @driver.action.send_keys(:enter).perform
  end

  def login_user
    register_user

    @driver.find_element(:class, 'logout').click
    @driver.find_element(:class, 'login').click
    @driver.find_element(:id, 'username').send_keys @login
    @driver.find_element(:id, 'password').send_keys @password
    @driver.find_element(:name, 'login').click
  end

  def register_user
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'register').click
    @wait.until {@driver.find_element(:id, 'user_login').displayed?}
    @login = 'login'+rand(99999).to_s
    @password = 'Qwerty11'
    @driver.find_element(:id, 'user_login').send_keys(@login)
    @driver.find_element(:id, 'user_password').send_keys(@password)
    @driver.find_element(:id, 'user_password_confirmation').send_keys(@password)
    @driver.find_element(:id, 'user_firstname').send_keys(@login)
    @driver.find_element(:id, 'user_lastname').send_keys(@login)
    @driver.find_element(:id, 'user_mail').send_keys(@login + '@q.com')
    @driver.find_element(:name, 'commit').click
  end

end