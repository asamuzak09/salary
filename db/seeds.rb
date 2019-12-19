# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(name1: "a", name2: "a", email: "a@a", password: "000000")
user2 = User.create(name1: "b", name2: "b", email: "b@b", password: "000000")
admin = Admin.create( email: "admin@admin", password: "000000")
salary1 = Salary.create(
    user_id: user1.id,
    priority: 1,
    payment0: 1000,
    payment1: 1000,
    payment2: 1000,
    payment3: 1000,
    payment4: 1000,
    payment5: 1000,
    payment6: 1000,
    payment7: 1000,
    payment8: 1000,
    payment9: 1000,
    payment10: 1000,
    payment11: 1000,
    payment12: 1000,
    payment13: 1000,
    payment14: 1000,
    payment15: 1000,
    payment16: 1000,
    payment17: 1000,
    payment18: 1000,
    payment19: 1000,
    payment20: 1000,
    payment21: 1000,
    payment22: 1000,
    payment23: 1000,
    )
salary2 = Salary.create(
    user_id: user2.id,
    priority: 1,
    payment0: 1000,
    payment1: 1000,
    payment2: 1000,
    payment3: 1000,
    payment4: 1000,
    payment5: 1000,
    payment6: 1000,
    payment7: 1000,
    payment8: 1000,
    payment9: 1000,
    payment10: 1000,
    payment11: 1000,
    payment12: 1000,
    payment13: 1000,
    payment14: 1000,
    payment15: 1000,
    payment16: 1000,
    payment17: 1000,
    payment18: 1000,
    payment19: 1000,
    payment20: 1000,
    payment21: 1000,
    payment22: 1000,
    payment23: 1000,
    )    
