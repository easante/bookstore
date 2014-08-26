# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  Author.create!(first_name: 'Agatha', last_name: 'Christie')
  Author.create!(first_name: 'James', last_name: 'Chase')
  Author.create!(first_name: 'Sydney', last_name: 'Sheldon')
  Author.create!(first_name: 'Obie', last_name: 'Fernandez')
  Author.create!(first_name: 'Cloves', last_name: 'Carneiro')
  Author.create!(first_name: 'Rida', last_name: 'Al Barazi')

  Publisher.create!([{name: 'Wiley'}, {name: 'Addison Wesley'},
    {name: 'Peachpit Press'}, {name: 'Manning'}, {name: 'Apress'},
    {name: 'Prentice Hall'}])

  Book.create!(title: 'JavaScript Visual Quickstart Guide', isbn: '978-0-321-77297-8',
    page_count: 518, price: 38.75, description: 'A very cool and thorough js book',
    published_at: '2012-08-23', publisher_id: 3,
    book_cover: File.open(File.join(Rails.root, 'db/Proforma 1.jpg')))

  Book.create!(title: 'Gnuplot in Action', isbn: '978-1-933-98839-9',
    page_count: 360, price: 66.37, description: 'A book on the awesome opensource plotting software',
    published_at: '2010-11-04', publisher_id: 4,
    book_cover: File.open(File.join(Rails.root, 'db/Proforma 2.jpg')))

  User.create(email:'emmanuel@example.com', first_name:'Emmanuel', last_name:'Asante', password:'password')
