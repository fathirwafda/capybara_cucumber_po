When(/^User click Produk Terlaris tab$/) do
  @browser = SearchPage.new
  @browser.verify_sort_panel
  @browser.click_terlaris
end

When(/^User choose first product on the list$/) do
  @browser = SearchPage.new
  @browser.choose_first_product
end