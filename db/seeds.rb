# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.where(id: 1).first_or_create(name: 'admin')
Role.where(id: 2).first_or_create(name: 'student')

Subject.where(id: 1).first_or_create(credits: 0.5, name: 'Citizenship')
Subject.where(id: 2).first_or_create(credits: 0.5, name: 'Economics')
Subject.where(id: 3).first_or_create(credits: 0.5, name: 'Geography')
Subject.where(id: 4).first_or_create(credits: 0.5, name: 'World History')
Subject.where(id: 5).first_or_create(credits: 0.5, name: 'US History')
Subject.where(id: 6).first_or_create(credits: 3.0, name: 'Math')
Subject.where(id: 7).first_or_create(credits: 0.5, name: 'Science')
Subject.where(id: 8).first_or_create(credits: 1.0, name: 'Chemistry')
Subject.where(id: 9).first_or_create(credits: 1.0, name: 'Physics')
Subject.where(id: 10).first_or_create(credits: 4.0, name: 'English')
Subject.where(id: 11).first_or_create(credits: 1.0, name: 'Biology')

Subject.find_each {|subject| subject.import }
