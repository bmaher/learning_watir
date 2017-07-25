require_relative 'google_results_page'

class GoogleHomePage

  HOME_PAGE_URI = 'http://www.google.com'

  def initialize(browser)
    @browser = browser
  end

  def visit
    @browser.goto(HOME_PAGE_URI)
  end

  def open_menu
    @browser.a(:id => 'open-main-menu').click
    @browser.nav(:id => 'main-menu').a(:text => 'Blog').click
  end

  def page_title
    @browser.title
  end

  def search_for(query)
    @browser.input(id: 'lst-ib').send_keys(query)
    GoogleResultsPage.new(@browser)
  end

end
