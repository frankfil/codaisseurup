FactoryGirl.define do
  factory :event do
    name            "OpenHack Edition"
    description     "We are teaming up with Microsoft to bring you a special Circus event at De Hallen in Amsterdam West"
    location        "De Hallen Bellamystraat 1 Amsterdam"
    includes_food   true
    includes_drinks true
    price           10
    starts_at       Faker::Date.forward(1)
    ends_at         Faker::Date.forward(2)
    capacity        50
    active          true
    user            { build(:user)}
    categories      [programming]

    trait active do
      active true
    end

    trait inactive do
      active false
    end
  end
end
