# frozen_string_literal: true

# Home page
class HomePage < SitePrism::Page

  path = '/'
  set_url(path)

  element :close_popup_home, '.btn-close.closeBtnMainPromo'
  element :search_field, '#AKCKwd'
  element :search_keyword, :xpath, '//strong[contains(text(),"komputer")]'

  def click_close_popup_home
    wait_until_close_popup_home_visible(wait: 5)
    self.close_popup_home.click if page.has_css?('.btn-close.closeBtnMainPromo')
  end

  def search_product(product)
    wait_until_search_field_visible(wait: 5)
    search_field.send_keys(product, :enter)
    sleep 5
    scroll_down(100)
  end

  def verify_seo_key_title(title)
    first(:xpath, "//h3[contains(text(), '#{title}')]").should be_visible
  end
end
