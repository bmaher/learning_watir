require 'rspec'
require 'watir'
require_relative '../pages/google_home_page'

Given /^I am on the Google Home Page$/ do
  @browser = Watir::Browser.new(:chrome)
  @google = GoogleHomePage.new(@browser)
  @google.visit
end

When /^I enter the search term '(.+)'$/ do |search_term|
  @search_term = search_term
  @results = @google.search_for(search_term)
  Watir::Wait.until { @results.page_title.include? search_term }
  @results.search_results.size.should be > 0
  texts = []  
  @results.search_results.each do |result|
    texts << result.text
  end
  texts.size.should be > 0
end

Then /^I am taken to the Google Results Page$/ do
  @results.page_title.include?(@search_term).should be true
end

Then /^I can follow the link to one of the results$/ do
  @results.number_of_search_results.should be > 0
  @results.first_search_result.a.click
  unless @browser.ready_state.eql? "complete"
    @browser.wait
  end
  @results.page_title.downcase.include?(@search_term).should be true
end
