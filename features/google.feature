Feature: Google

Scenario: Search for something on Google
  Given I am on the Google Home Page
  When I enter the search term 'watir'
  Then I am taken to the Google Results Page
  And I can follow the link to one of the results 
