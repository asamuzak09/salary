# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(name1: "a", name2: "a")
user2 = User.create(name1: "b", name2: "b")
admin = Admin.create( email: "admin@admin", password: "000000")
salary1 = Salary.create(
    user_id: user1.id,
    priority: 1,
    payment: 1000,
    overtime_pay: 1000,
    holiday_pay: 1000
    )
salary2 = Salary.create(
    user_id: user2.id,
    priority: 1,
    payment: 1000,
    overtime_pay: 1000,
    holiday_pay: 1000
    )    
