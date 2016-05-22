require 'test-unit'
require 'selenium-webdriver'
require_relative 'helper_methods'

class TestLogin < Test::Unit::TestCase
  include HelperMethods

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def test_login
    login_user
    myaccount_button = @driver.find_element(:class, 'my-account')
    assert(myaccount_button.displayed?)
  end

  def teardown
    @driver.quit
  end

end