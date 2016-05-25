require 'test-unit'
require 'selenium-webdriver'
require_relative 'helper_methods'

class TestRedmineApp < Test::Unit::TestCase
  include HelperMethods

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def registration
    register_user
    actual_text = @driver.find_element(:id, 'flash_notice')
    assert(actual_text.displayed?)
  end

  def test_login
    register_user
    login_user
    myaccount_button = @driver.find_element(:class, 'my-account')
    assert(myaccount_button.displayed?)
  end

  def test_logout
    register_user
    login_user
    @driver.find_element(:class, 'logout').click
    login_button = @driver.find_element(:class, 'login')
    assert(login_button.displayed?)
  end

  def test_change_password
    register_user
    change_password
    actual_text = @driver.find_element(:id, 'flash_notice')
    assert(actual_text.displayed?)
  end

  def test_create_project
    register_user
    create_project
    actual_text = @driver.find_element(:id, 'flash_notice')
    assert(actual_text.displayed?)
  end

  def test_create_project_version
    register_user
    create_project
    create_project_version
    expected_text = @version_name
    actual_text = @driver.find_element(:link, @version_name).text
    assert_equal(expected_text,actual_text)
  end

  def test_create_issues
    register_user
    create_project
    create_issue_normal
    create_issue_low
    create_issue_immediate
    @driver.find_element(:css, "a.issues.selected").click
    issue_normal = @driver.find_element(:link, @issue_normal_subject)
    issue_low = @driver.find_element(:link, @issue_low_subject)
    issue_immediate = @driver.find_element(:link, @issue_immediate_subject)
    assert(issue_normal.displayed?)
    assert(issue_low.displayed?)
    assert(issue_immediate.displayed?)
  end

  def test_add_user
    register_user1
    @driver.find_element(:class, 'logout').click
    register_user
    create_project
    add_user
    user_link = @driver.find_element(:link, "#{@login1}\s#{@login1}")
    assert(user_link.displayed?)
  end

  def test_edit_user
    register_user
    create_project
    edit_user
    @wait.until {@driver.find_element(:xpath, ".//span[contains(.,'Manager, Developer')]").displayed?}
    user_roles = @driver.find_element(:xpath, ".//span[contains(.,'Manager, Developer')]")
    assert(user_roles.displayed?)
  end

  def teardown
    @driver.quit
  end

end