# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Wine.destroy_all
wines = Wine.create([{ name: 'Santa Helena'}, {name: 'Casillero del Diablo'}, {name: 'Tres Medallas'}])

Strain.destroy_all
strains = Strain.create([{ name: 'Merlot'}, {name: 'Carmenere'}, {name: 'Cabernet Souvignon'}, {name: 'Chardonnay'}, {name: 'Malbec'}, {name: 'Pinot Noir'}, {name: 'Souvignon Blanc'}, {name: 'Garnacha'}])

WineStrain.destroy_all
wine_strains = WineStrain.create([{ wine_id: 1, strain_id: 1, percentage: 80}, { wine_id: 1, strain_id: 2, percentage: 20}])


User.destroy_all
users = User.create([{email: 'admin@admin.com', password: 'valid_password', password_confirmation: 'valid_password'}, {email: 'friend@friend.com', password: 'valid_password', password_confirmation: 'valid_password'}])

Role.destroy_all
roles = Role.create([{name: 'admin'}, {name: 'friend'}])

Assignment.destroy_all
assignments = Assignment.create([{user_id: 1, role_id: 1}, {user_id: 2, role_id: 2}])

