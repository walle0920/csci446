require 'test_helper'

class PetTest < ActiveSupport::TestCase
  fixtures :pets
  test "pet attributes must not be empty" do
     pet = Pet.new
    assert pet.invalid?
    assert pet.errors[:name].any?
     assert pet.errors[:age].any?
     assert pet.errors[:breed].any?
     assert pet.errors[:picture].any?
     assert pet.errors[:description].any?
     assert pet.errors[:tendencies].any?
  end

  test "pet age and stay must be positive" do
    pet = Pet.new(name: "bob",
                  picture: "husk.jpg",
                  breed: "husky",
                  age: "10",
                  stay: "1",
                  description: pets(:betty).description,
                  tendencies:pets(:betty).tendencies,
                  status:pets(:betty).status)
    assert pet.valid?

    pet.age = -1
    assert pet.invalid?
    assert_equal ["must be greater than or equal to 0.01"], pet.errors[:age]

    pet.age = 0
    assert pet.invalid?
    assert_equal ["must be greater than or equal to 0.01"], pet.errors[:age]

    pet.age = 1
    pet.stay = -1
    assert pet.invalid?
    assert_equal ["must be greater than or equal to 0.01"], pet.errors[:stay]

    pet.stay = 0
    assert pet.invalid?
    assert_equal ["must be greater than or equal to 0.01"], pet.errors[:stay]

  end

  test "pet names should be set" do

    pet1 = Pet.new(name: "bob",
                  picture: "husk.jpg",
                  breed: "husky",
                  age: "10",
                  stay: "1",
                  description: pets(:betty).description,
                  tendencies:pets(:betty).tendencies,
                  status:pets(:betty).status)

    pet2 = Pet.new(name: "bob",
                  picture: "husk.jpg",
                  breed: "husky",
                  age: "10",
                  stay: "1",
                  description: pets(:betty).description,
                  tendencies:pets(:betty).tendencies,
                  status:pets(:betty).status)

    assert_equal pet1.attributes[:name], pet2.attributes[:name]
  end

  def new_pet(picture)
    Pet.new(name: "bob",
            picture: picture,
            breed: "husky",
            age: "10",
            stay: "1",
            description: "MyText",
            tendencies: "MyText",
            status: pets(:betty).status)
  end

  test "picture url" do
    ok = %w{ fred.gif fred.jpg fred.png fred.GIF FRED.JPG http://a.b.c/x/fred.gif}
    bad = %w{fred.doc fred.jpg/more fred.gif.more}
    ok.each do |name| assert new_pet(name).valid?, "#{name} should be valid" end
    bad.each do |name| assert new_pet(name).invalid?, "#{name} should be invalid"end
  end
end
