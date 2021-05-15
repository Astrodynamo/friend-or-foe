# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

businesses = Business.create([
    { name: 'Stuff Inc.', primary_location: 'Alaska' },
    { name: 'MoreStuff Inc.', primary_location: 'Hawaii' },
    { name: 'SomeStuff LLC', primary_location: 'Nebraska' }
])

users = User.create([
    { name: 'Jerry', password: 'password', business: businesses[0] },
    { name: 'Tom', password: 'password', business: businesses[0] },
    { name: 'Sharon', password: 'password', business: businesses[1] },
    { name: 'Mark', password: 'password', business: businesses[1] },
    { name: 'Erin', password: 'password', business: businesses[2] }
])

clients = Client.create([
    { name: 'Karen' },
    { name: 'Joe' },
    { name: 'Asha' },
    { name: 'Wendel' }
])

reports = Report.create([
    { user: users[0], client: clients[0], date: '2021-05-12', positive: false, payment: false, appointment: true, rating: 1, blacklist: true },
    { user: users[2], client: clients[0], date: '2021-05-12', positive: true, payment: true, appointment: true, rating: 4, blacklist: false },
    { user: users[3], client: clients[0], date: '2021-05-12', positive: false, payment: false, appointment: false, rating: 1, blacklist: true },
    { user: users[1], client: clients[1], date: '2021-05-12', positive: true, payment: true, appointment: true, rating: 5, blacklist: false },
    { user: users[4], client: clients[3], date: '2021-05-12', positive: true, rating: 4, blacklist: false },
    { user: users[0], client: clients[1], date: '2021-05-12', positive: true, payment: true, appointment: true, rating: 5, blacklist: false },
    { user: users[2], client: clients[2], date: '2021-05-12', positive: false, payment: false, appointment: false, rating: 1, blacklist: true }
])