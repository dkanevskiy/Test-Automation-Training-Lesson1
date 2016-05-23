require 'test-unit'
require 'selenium-webdriver'
require_relative 'helper_methods'

class TestAddUser < Test::Unit::TestCase
  include HelperMethods

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
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

  def teardown
    @driver.quit
  end

end