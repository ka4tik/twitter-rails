require 'faker'
namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin=User.create!(:name=>"Kartik Singal",
                 :email=>"ka4tik@gmail.com",
                 :password =>"foobar",
                 :admin=>true)
    99.times do |n|
      name=Faker::Name.name
      email="example#{n+1}@gmail.com"
      password="foobar"
      User.create!(:name=>name,:email=>email,:password=>password)
    end
  end
end