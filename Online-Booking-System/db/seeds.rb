# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
StudentClass.create(StudentClass:'Junior Infants')
 StudentClass.create(StudentClass:'Senior Infants')
StudentClass.create(StudentClass:'1st Class')
StudentClass.create(StudentClass:'2nd Class')
StudentClass.create(StudentClass:'3rd Class')
StudentClass.create(StudentClass:'4th Class')
StudentClass.create(StudentClass:'5th Class')
StudentClass.create(StudentClass:'6th Class')

User.create({first_name:"Admin",last_name:"McAdminface",email:"admin@email.com",password:"Stoneybatter12",password_confirmation:"Stoneybatter12",authenicated:true,admin:true})
