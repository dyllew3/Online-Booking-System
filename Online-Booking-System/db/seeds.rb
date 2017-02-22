# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin1 = User.create(first_name:'Dylan',last_name:'Lewis',email:'root@email.com',password:'rootpassword69',password_confirmation:'rootpassword69',admin:true)

