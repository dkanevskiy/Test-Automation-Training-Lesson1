require 'test-unit'
require 'selenium-webdriver'
require_relative 'helper_methods'

class TestEditUser < Test::Unit::TestCase
  include HelperMethods

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def test_edit_user
    edit_user
    @wait.until {@driver.find_element(:xpath, ".//span[contains(.,'Manager, Developer')]").displayed?}
    user_roles = @driver.find_element(:xpath, ".//span[contains(.,'Manager, Developer')]")
    assert(user_roles.displayed?)
  end

  def teardown
    @driver.quit
  end

end