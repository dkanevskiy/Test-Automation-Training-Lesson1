require 'test-unit'
require 'selenium-webdriver'
require_relative 'change_password.rb'

class TestChangePassword < Test::Unit::TestCase
  include ChangePassword

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def test_change_password
    change_password
    expected_text = 'Password was successfully updated.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def teardown
    @driver.quit
  end

end