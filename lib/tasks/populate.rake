namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    # Need two gems to make this work: faker & populator
    # Docs at: http://faker.rubyforge.org/rdoc/
    require 'faker'
    
    # Step 1: clear any old data in the db
    [Post, User].each(&:delete_all)
    
    # create users
    25.times do |i|
      user = User.new
      user.name = Faker::Name.name
      user.email = Faker::Internet.email
      user.password = 'secret'
      user.password_confirmation = 'secret'
      user.save!
    end
    
    all_users = User.all

    all_users.each do |user|
      number_of_posts = rand(10) + 1

      number_of_posts.times do |i|
        post = Post.new
        post.title = Faker::Company.catch_phrase
        post.description = Faker::Lorem.paragraph
        post.created_at = (2.years.ago.to_date..2.days.ago.to_date).to_a.sample
        post.user_id = user.id
        chance_of_clicks = rand(4)
        unless chance_of_clicks.zero?
          post.click_count = rand(5) + 1
        end
        post.save!
      end

    end
    
  end
end