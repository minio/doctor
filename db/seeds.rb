# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#=begin

Document.delete_all
Category.delete_all
User.delete_all
Brand.delete_all

if User.count == 0
  User.new({:email =>'sysadmin@doctor.io', :password => 'Doctor!23', :password_confirmation => 'Doctor!23', :admin => true }).save
  
end

if Brand.count == 0
  Brand.new({:title => 'Doctor', :footer_text => 'Doctor Project is licensed under Apache 2.0 License.'}).save
end

c1 = Category.create!(title:'Doctor Docs',
desc: %{Think of this as a folder that holds several documents},
)
  d1 = Document.create!(name: 'Doctor Quickstart Guide',
  description: %{Create a docs site using Doctor. It's fast, easy and simple.'},
  category_id: c1.id,
  link: 'https://raw.githubusercontent.com/minio/doctor/master/README.md'
  )
  

 
  
  
 





#=end