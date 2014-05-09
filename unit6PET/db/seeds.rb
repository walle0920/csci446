# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Pet.delete_all

Pet.create!(name: 'KIMI', breed: 'Chinchillas', age: 1, stay: 2, picture: "Chinchillas.jpg",
            description: %{<p> Chinchillas are crepuscular (most active around dawn and dusk) rodents, slightly larger and more robust than ground squirrels. They are native to the Andes mountains in South America and live in colonies called "herds" at high altitudes up to 4,270 metres (14,000 ft). Historically, chinchillas lived in the Andes of Bolivia, Peru, and Chile, but today colonies in the wild remain only in Peru and Chile.[3] Along with their relatives, viscachas, they make up the family Chinchillidae. </p>},
            tendencies: "lazy",
            status: "available"
)
Pet.create!(name: 'eve', breed: 'Husky', age: 2, stay: 1, picture: "husky.jpg",
            description: %{<p> Husky /ˈhʌski/ is a general name for a type of dog used to pull sleds in northern regions, differentiated from other sled-dog types by their fast pulling style. They are "an ever-changing cross-breed of the...fastest dogs". The Alaskan Malamute, by contrast, is "the largest and most powerful" sled dog, and was used for heavier loads. Huskies are used in sled dog racing. In recent years companies have been marketing tourist treks with dog sledges for adventure travelers in snow regions as well. Huskies are also today kept as pets, and groups work to find new pet homes for retired racing and adventure trekking dogs. </p>},
            tendencies: "lively",
            status: "available"
)
Pet.create!(name: 'mike', breed: 'Scottish Fold', age: 3, stay: 1, picture: "Scottish Fold.jpg",
            description: %{<p> The Scottish Fold is a breed of cat with a natural dominant-gene mutation that makes its ear cartilage contain a fold, causing the ears to bend forward and down towards the front of their head, which gives the cat what is often described as an "owl-like" appearance.  </p>},
            tendencies: "always want to play with you !",
            status: "available"
)