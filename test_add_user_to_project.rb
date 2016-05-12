require 'test-unit'
require 'selenium-webdriver'
require_relative 'registration.rb'

class ChangePassword < Test::Unit::TestCase
  include Registration

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def test_change_password
    register_user
    @driver.find_element(:css, ".projects").click
    @driver.find_element(:css, ".icon.icon-add").click
    @project_name = 'Project' + rand(9999).to_s
    @driver.find_element(:css, "#project_name").send_keys(@project_name)
    @driver.find_element(:xpath, ".//*[@id='new_project']/input[@name='commit']").click
    expected_text = 'Successful update.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert(expected_text, actual_text)
  end

  def teardown
    @driver.quit
  end

end