json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :picture, :breed, :age, :stay, :description, :tendencies
  json.url pet_url(pet, format: :json)
end
