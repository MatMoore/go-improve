# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless Rails.env.production?
    seed_file = File.join(File.dirname(__FILE__), 'player_seeds.json')
    user_attrs = JSON.parse(File.read(seed_file)).map(&:symbolize_keys)
    user_attrs << {
        display_name: 'Test User',
        rank: "25k",
        review_period: 7,
        email: 'test@test.com',
    }

    user_attrs.each do |attrs|
        created_user = User.find_or_create_by(
            display_name: attrs.delete(:display_name)
        ) do |user|
            user.assign_attributes(attrs)
            user.password = 'password'
            user.password_confirmation = 'password'
        end
        created_user.confirm unless created_user.created_at
    end
end
