# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# team 1:<->:n member
Team.delete_all
Member.delete_all

team = Team.new(name: 'Team A', description: 'In China')
team.save!
team.members.build(name: 'Abe', age: 30, mail: 'abe@example.com')
team.members.build(name: 'Inoue', age: 40, mail: 'inoue@example.com')
team.save!

team = Team.new(name: 'Team B', description: 'In Tokyo, japan')
team.save!
team.members.build(name: 'Kato', age: 30, mail: 'kato@example.com')
team.save!
