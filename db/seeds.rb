# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Strain.destroy_all
strains = Strain.create([{ name: 'Merlot'}, {name: 'Carmenere'}, {name: 'Cabernet Souvignon'}, {name: 'Chardonnay'}, {name: 'Malbec'}, {name: 'Pinot Noir'}, {name: 'Souvignon Blanc'}, {name: 'Garnacha'}])

Wine.destroy_all
wines = Wine.create([{ name: 'Santa Helena'}, {name: 'Casillero del Diablo'}, {name: 'Tres Medallas'}])

WineStrain.destroy_all
wine_strains = WineStrain.create([{ wine_id: 1, strain_id: 1, percentage: 80}, { wine_id: 1, strain_id: 2, percentage: 20}])


