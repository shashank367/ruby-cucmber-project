require 'watir' 
require 'selenium-webdriver'

Given("I have entered {string} into the query.") do |string|
 Selenium::WebDriver::Firefox.driver_path="C:/Users/ADMIN/RubymineProjects/geckodriver.exe"
@browser=Watir::Browser.new :firefox
@browser.goto "google.com" 
@browser.text_field(:name => "q").set string
end

When /^I click "([^"]*)"$/ do |button_name| 
@browser.button.click
end 

Then /^I should see some results$/ do 
@browser.div(:id => "resultStats").wait_until_present 
@browser.div(:id => "resultStats").should exist 
@browser.close 
end