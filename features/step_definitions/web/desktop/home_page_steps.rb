Given(/^visit home page$/) do
  @browser = HomePage.new
  @browser.load
  # @browser.click_close_popup_home
end

When(/^user fill in "([^"]*)" on the search field$/) do |product|
  @browser = HomePage.new
  @browser.search_product(product)
end
