require 'faker'

10.times do |n|
    name = Faker::Name.name
    Plan.create!(name: name
                )
end