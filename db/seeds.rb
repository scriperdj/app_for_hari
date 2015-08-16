# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email:"admin@haristudio.com", password:"haristudio", admin:true)
gallery = Gallery.create(name:"home_cover", event_date: "01/01/2015")
picture = Picture.create(gallery_id: gallery.id)
#picture.image = File.open("/home/scriperdj/rails_projects/hari_web/public/images/photography/fullscreen11.jpg")
#picture.save!
