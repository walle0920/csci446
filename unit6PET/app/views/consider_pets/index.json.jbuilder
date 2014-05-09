json.array!(@consider_pets) do |consider_pet|
  json.extract! consider_pet, :id, :pet_id, :consider_cart_id
  json.url consider_pet_url(consider_pet, format: :json)
end
