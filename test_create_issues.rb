require 'test-unit'
require 'selenium-webdriver'
require_relative 'helper_methods'

class TestCreateIssues < Test::Unit::TestCase
  include HelperMethods

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def test_create_issues
    create_issues

    issue1 = @driver.find_element(:link, @issue1_subject)
    issue2 = @driver.find_element(:link, @issue2_subject)
    issue3 = @driver.find_element(:link, @issue3_subject)
    assert(issue1.displayed?)
    assert(issue2.displayed?)
    assert(issue3.displayed?)
  end

  def teardown
    @driver.quit
  end

end