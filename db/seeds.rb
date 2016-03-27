# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless Rails.env.production?
    user = User.where(email: "test@test.com").first_or_create! do |u|
        u.display_name = 'Test User'
        u.rank = "25k"
        u.review_period = 7
        u.email = 'test@test.com'
        u.password = 'password'
        u.password_confirmation = 'password'
    end
    user.confirm
end
