require 'test-unit'
require 'selenium-webdriver'
require_relative 'helper_methods'

class TestCreateProjectVersion < Test::Unit::TestCase
  include HelperMethods

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def test_create_project_version
    register_user
    create_project
    create_project_version

    expected_text = @version_name
    actual_text = @driver.find_element(:link, @version_name).text
    assert_equal(expected_text,actual_text)
  end

  def teardown
    @driver.quit
  end

end