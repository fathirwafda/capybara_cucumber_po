class ProductPage < SitePrism::Page
  
  element :quantity_value, '#optionStock0'
  element :button_add_to_cart, '.btnStyle.btnFlat.btnL.btnOrangeW'
  element :button_ya_to_cart, :xpath, '/html/body/section/section/form[1]/div[1]/div[3]/div[6]/div[2]/div[2]/a[1]'

  def add_quantity(qty)
    wait_until_quantity_value_visible(wait: 10)
    quantity_value.set(qty)
  end

  def add_to_cart
    sleep 3
    button_add_to_cart.click
    wait_until_button_ya_to_cart_visible(wait: 5)
    button_ya_to_cart.click
  end
end