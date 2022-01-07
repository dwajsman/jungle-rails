class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['USER_AUTH'], password: ENV['PASS_AUTH']

  def show
    @product_count = Product.count
    @category_count = Category.count
  end

end


# https://stackoverflow.com/questions/18764418/how-to-count-user-inputs-from-a-controller


# https://riptutorial.com/ruby-on-rails/example/11651/-group-and--count

#<Product:0x00000001119968c8
#  id: 1,
#  name: "Men's Classy shirt",
#  description:
#   "Biodiesel truffaut hoodie umami +1 raw denim artisan celiac. Salvia +1 chartreuse muggle magic marfa. Small batch direct trade gluten-free flannel. Forage viral truffaut try-hard mustache.",
#  image: "apparel1.jpg",
#  price_cents: 6499,
#  quantity: 10,
#  created_at: Thu, 06 Jan 2022 06:45:55 UTC +00:00,
#  updated_at: Thu, 06 Jan 2022 06:45:55 UTC +00:00,
#  category_id: 1>
