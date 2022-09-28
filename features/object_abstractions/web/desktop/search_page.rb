class SearchPage < SitePrism::Page
  # path: '/search?q=komputer&lCtgrNo='
  # set_url(path) #optionStock0

  element :tab_terlaris, :xpath, '//*[text()="Produk terlaris"]'
  element :sort_panel, "#searchCondition_wrap"
  element :first_product, '#prod_28911164'
  element :first_product_link_direct, :xpath, '/html/body/section/section/article[2]/div[1]/div[2]/ul/ul[1]/li[1]/div/a[2]'


  def verify_sort_panel
    wait_until_sort_panel_visible(wait: 5)
  end
    
  def click_terlaris
    wait_until_tab_terlaris_visible(wait: 5)
    tab_terlaris.click
    sleep 5
  end

  def verify_first_product
    wait_until_first_product_visible(wait: 5)
    scroll_down(200)
  end

  def choose_first_product
    first_product.click
  end
end
