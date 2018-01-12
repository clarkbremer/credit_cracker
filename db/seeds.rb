# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.where(id: 1).first_or_create(name: 'admin')
Role.where(id: 2).first_or_create(name: 'student')

Subject.where(name: 'Citizenship').first_or_create(credits: 0.5)
Subject.where(name: 'Economics').first_or_create(credits: 0.5)
Subject.where(name: 'Geography').first_or_create(credits: 0.5)
Subject.where(name: 'World History').first_or_create(credits: 0.5)
Subject.where(name: 'US History').first_or_create(credits: 0.5)
Subject.where(name: 'Math').first_or_create(credits: 3.0)
Subject.where(name: 'Science').first_or_create(credits: 1.0)
Subject.where(name: 'Chemistry').first_or_create(credits: 1.0)
Subject.where(name: 'Physics').first_or_create(credits: 1.0)
Subject.where(name: 'English').first_or_create(4.0)

Subject.find_each {|subject| subject.import }
