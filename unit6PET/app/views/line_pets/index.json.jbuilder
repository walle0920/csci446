json.array!(@line_pets) do |line_pet|
  json.extract! line_pet, :id, :pets_id, :fostered_id
  json.url line_pet_url(line_pet, format: :json)
end
