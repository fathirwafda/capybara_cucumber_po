When(/^user fill in "([^"]*)" quantity of product$/) do |qty|
  @browser = ProductPage.new
  @browser.add_quantity(qty)
  @browser.add_to_cart
end