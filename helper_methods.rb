module HelperMethods

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

  def register_user1
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'register').click
    @wait.until {@driver.find_element(:id, 'user_login').displayed?}
    @login1 = 'login'+rand(99999).to_s
    @password = 'Qwerty11'
    @driver.find_element(:id, 'user_login').send_keys(@login1)
    @driver.find_element(:id, 'user_password').send_keys(@password)
    @driver.find_element(:id, 'user_password_confirmation').send_keys(@password)
    @driver.find_element(:id, 'user_firstname').send_keys(@login1)
    @driver.find_element(:id, 'user_lastname').send_keys(@login1)
    @driver.find_element(:id, 'user_mail').send_keys(@login1 + '@q.com')
    @driver.find_element(:name, 'commit').click
  end

  def login_user
    if @driver.find_element(:class, 'logout').displayed?
      @driver.find_element(:class, 'logout').click
    end
    @driver.find_element(:class, 'login').click
    @driver.find_element(:id, 'username').send_keys @login
    @driver.find_element(:id, 'password').send_keys @password
    @driver.find_element(:name, 'login').click
  end

  def change_password
    @new_password = @password + '1'
    @driver.find_element(:class, "my-account").click
    @driver.find_element(:xpath, ".//*[@id='content']//a[@class='icon icon-passwd']").click
    @driver.find_element(:id, "password").send_keys(@password)
    @driver.find_element(:id, "new_password").send_keys(@new_password)
    @driver.find_element(:id, "new_password_confirmation").send_keys(@new_password)
    @driver.find_element(:name, "commit").click
  end

  def create_project
    @driver.find_element(:class, "projects").click
    @driver.find_element(:xpath, ".//*[@id='content']//a[@class='icon icon-add']").click
    @project_name = 'Project' + rand(9999).to_s
    @driver.find_element(:id, "project_name").send_keys(@project_name)
    @driver.find_element(:xpath, ".//*[@id='new_project']/input[@name='commit']").click
  end

  def create_project_version
    @driver.find_element(:id, 'tab-versions').click
    @driver.find_element(:xpath, ".//*[@id='tab-content-versions']//a[@class='icon icon-add']").click
    @version_name = 'version'+rand(99999).to_s
    @driver.find_element(:id, 'version_name').send_keys(@version_name)
    @driver.find_element(:xpath, ".//*[@id='new_version']/input[@type='submit']").click
  end

  def create_issues
    @issue1_subject = 'subject' + rand(99999).to_s
    @issue2_subject = 'subject' + rand(99999).to_s
    @issue3_subject = 'subject' + rand(99999).to_s

    @driver.find_element(:class, "new-issue").click
    @wait.until {@driver.find_element(:id, "issue_subject").displayed?}
    @driver.find_element(:id, "issue_subject").send_keys(@issue1_subject)
    @driver.find_element(:xpath, ".//*[@id='issue-form']/input[@value='Create']").click

    @driver.find_element(:class, "new-issue").click
    @wait.until {@driver.find_element(:id, "issue_subject").displayed?}
    @driver.find_element(:id, "issue_subject").send_keys(@issue2_subject)
    @driver.find_element(:id, "issue_priority_id").click
    @driver.find_element(:xpath, ".//*[@id='issue_priority_id']/option[@value='5']").click
    @driver.find_element(:xpath, ".//*[@id='issue-form']/input[@value='Create']").click
    @driver.find_element(:xpath, ".//*[@id='issue-form']/input[@value='Create']").click

    @driver.find_element(:class, "new-issue").click
    @wait.until {@driver.find_element(:id, "issue_subject").displayed?}
    @driver.find_element(:id, "issue_subject").send_keys(@issue3_subject)
    @driver.find_element(:id, "issue_priority_id").click
    @driver.find_element(:xpath, ".//*[@id='issue_priority_id']/option[@value='6']").click
    @driver.find_element(:xpath, ".//*[@id='issue-form']/input[@value='Create']").click
    @driver.find_element(:xpath, ".//*[@id='issue-form']/input[@value='Create']").click
    @driver.find_element(:xpath, ".//*[@id='main-menu']//a[@class='issues selected']").click
  end

  def add_user
    @driver.find_element(:id, "tab-members").click
    @driver.find_element(:xpath, ".//*[@id='tab-content-members']//a[@class='icon icon-add']").click
    @wait.until {@driver.find_element(:id, "principal_search").displayed?}
    @driver.find_element(:id, "principal_search").send_keys(@login1)
    @wait.until {@driver.find_element(:xpath, ".//label[contains(text(),#{@login1})]").displayed?}
    @driver.find_element(:xpath, ".//*[@id='principals']//input[@type='checkbox']").click
    @driver.find_element(:xpath, ".//*[@id='new_membership']//input[@value='3']").click
    @driver.find_element(:id, "member-add-submit").click
    @wait.until {@driver.find_element(:class, "home").displayed?}
    @driver.find_element(:class, "home").click
    @wait.until {@driver.find_element(:link, "#{@project_name}").displayed?}
    @driver.find_element(:link, "#{@project_name}").click
  end

  def edit_user
    @driver.find_element(:id, "tab-members").click
    @driver.find_element(:xpath, ".//td/a[@class='icon icon-edit']").click
    @driver.find_element(:xpath, "*//input[@value='4'][@type='checkbox']").click
    @driver.action.send_keys(:enter).perform
  end

end