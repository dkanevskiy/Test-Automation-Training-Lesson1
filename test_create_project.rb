require 'test-unit'
require 'selenium-webdriver'
require_relative 'create_project.rb'

class TestCreateProject < Test::Unit::TestCase
  include CreateProject

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def test_create_project
    create_project
    expected_text = 'Successful creation.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text,actual_text)
  end

  def teardown
    @driver.quit
  end

end