require 'test-unit'
require 'selenium-webdriver'
require_relative 'create_project_version.rb'

class TestCreateProjectVersion < Test::Unit::TestCase
  include CreateProjectVersion

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def test_create_project_version
    create_project_version

    expected_text = @version_name
    actual_text = @driver.find_element(:link, @version_name).text
    assert_equal(expected_text,actual_text)
  end

  def teardown
    @driver.quit
  end

end