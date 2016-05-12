require 'test-unit'
require 'selenium-webdriver'
require_relative 'registration.rb'

class TestLogout < Test::Unit::TestCase
  include Registration

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def test_logout
    register_user
    @driver.find_element(:class, 'logout').click
    login_button = @driver.find_element(:class, 'login')
    assert(login_button.displayed?)
  end

  def teardown
    @driver.quit
  end

end