json.array!(@consider_carts) do |consider_cart|
  json.extract! consider_cart, :id
  json.url consider_cart_url(consider_cart, format: :json)
end
