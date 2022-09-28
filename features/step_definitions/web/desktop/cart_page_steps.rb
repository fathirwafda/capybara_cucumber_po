When(/^User change courier$/) do
  @browser = CartPage.new
  @browser.pilih_kurir
end

When(/^User cancel to choose a courier$/) do
  @browser = CartPage.new
  @browser.batal_pilih_kurir
end

Then(/^User undo the order and not to continue for purchasing$/) do
  @browser = CartPage.new
  @browser.hapus_pesanan
end