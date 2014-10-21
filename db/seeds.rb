# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Rol.create(rol_name: 'rol_admin', admin: true, module_1: true, module_2: true, module_3: true, module_4: true, module_5: true)
User.create(username: 'admin', password: 'admins', password_confirmation: 'admins', name: 'Admin', lastname: "Creta", email: 'admin@admin.com', rol_id: 1)
User.create(username: 'sebas', password: 'sebas', password_confirmation: 'sebas', name: 'Sebas', lastname: "Developer", email: 'sebastian@tbf.mx', rol_id: 1)
