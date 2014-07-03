namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(first: "Test",
    			 last: "User",
                 email: "test@test.com",
                 password: "password",
                 password_confirmation: "password")
    admin.toggle!(:admin)
  end
end