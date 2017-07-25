class GoogleResultsPage

  def initialize(browser)
    @browser = browser
  end

  def page_title
    @browser.title
  end

  def search_results
    @browser.divs(:class => 'g')
  end

  def number_of_search_results
    search_results.size
  end

  def first_search_result
    search_results[0]
  end

end
