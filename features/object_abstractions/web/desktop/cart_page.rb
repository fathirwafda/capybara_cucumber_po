class CartPage < SitePrism::Page
  element :ubah_kurir, :xpath, '/html/body/div[3]/section[1]/article/form/table/tbody/tr/td[6]/a[1]'
  # element :batal_kurir, :xpath, "//*[contains(text(),'Batal')]"
  # /html/body/section/form/article/p[3]/a[2]
  element :batal_kurir, :xpath, "/html/body/section/form/hgroup/a"
  element :hapus_barang_cart, :xpath, '/html/body/div[3]/section[1]/article/form/div[1]/p[1]/a[1]'
  element :ok_to_delete_cart, "#chkDelPopY"

  def pilih_kurir
    wait_until_ubah_kurir_visible(wait: 5)
    ubah_kurir.click
  end

  def batal_pilih_kurir
    if has_batal_kurir?
      wait_until_batal_kurir_visible(wait: 5)
      batal_kurir.click
    else
      page.execute_script "closeLayer();"
    end
  end

  def hapus_pesanan
    wait_until_hapus_barang_cart_visible(wait: 5)
    hapus_barang_cart.click
    wait_until_ok_to_delete_cart_visible(wait: 5)
    ok_to_delete_cart.click
  end
end