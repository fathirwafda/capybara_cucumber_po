Given(/^visit home page$/) do
  @browser = HomePage.new
  @browser.load
end

When(/^user fill in "([^"]*)" on the search field$/) do |product|
  @browser = HomePage.new
  @browser.search_product(product)
end
