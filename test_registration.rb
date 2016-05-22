require 'test-unit'
require 'selenium-webdriver'
require_relative 'helper_methods'

class TestRegistration < Test::Unit::TestCase
  include HelperMethods

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def test_positive
    register_user
    actual_text = @driver.find_element(:id, 'flash_notice')
    assert(actual_text.displayed?)
  end

  def teardown
    @driver.quit
  end

end