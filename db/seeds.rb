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
Staff.delete_all
Developer.delete_all

# team = Team.new(name: 'Team A', description: 'In China')
# team.save!
# team.members.create!(name: 'Abe', age: 30, mail: 'abe@example.com')
# team.members.create!(name: 'Inoue', age: 40, mail: 'inoue@example.com')
Person.create!([
  { name: 'Abe', age: 30, mail: 'abe@example.com' },
  { name: 'Inoue', age: 40, mail: 'inoue@example.com' },
  { name: 'Matu', age: 30, mail: 'matu@example.com' },
  { name: 'Duku', age: 30, mail: 'duku@example.com' }
])

per = Person.where('mail = ?', 'abe@example.com').first
staff1 = Staff.create!(skill: '経理')
jk = staff1.build_jobkind(jobkindable_type: 'Staff', jobkindable_id: staff1.id)
jk.person = per
jk = per.jobkinds.create!(jobkindable_type: jk.jobkindable_type, jobkindable_id: jk.jobkindable_id)
jk.person = per

per = Person.where('mail = ?', 'inoue@example.com').first
staff2 = Staff.create!(skill: '事務処理')
jk = staff2.build_jobkind(jobkindable_type: 'Staff', jobkindable_id: staff2.id)
jk.person = per
per.jobkinds.create!(jobkindable_type: jk.jobkindable_type, jobkindable_id: jk.jobkindable_id)

per = Person.where('mail = ?', 'matu@example.com').first
developer1 = Developer.create!(lang: 'ruby')
jk = developer1.build_jobkind(jobkindable_type: 'Developer', jobkindable_id: developer1.id)
jk.person = per
per.jobkinds.create!(jobkindable_type: jk.jobkindable_type, jobkindable_id: jk.jobkindable_id)

per = Person.where('mail = ?', 'duku@example.com').first
developer2 = Developer.create!(lang: 'java')
jk = developer2.build_jobkind(jobkindable_type: 'Developer', jobkindable_id: developer2.id)
jk.person = per
per.jobkinds.create!(jobkindable_type: jk.jobkindable_type, jobkindable_id: jk.jobkindable_id)

team = Team.new(name: 'Team A', description: 'In China')
team.save!(validate: false)
team.members.create!(target_id: staff1.id, target_type: 'Staff')
team.members.create!(target_id: developer1.id, target_type: 'Developer')

team = Team.new(name: 'Team B', description: 'In Tokyo, japan')
team.save!(validate: false)
team.members.create!(target_id: staff1.id, target_type: 'Staff')
team.members.create!(target_id: staff2.id, target_type: 'Staff')
team.members.create!(target_id: developer1.id, target_type: 'Developer')
team.members.create!(target_id: developer2.id, target_type: 'Developer')

# リレーションシップ
people = Person.all
person = people.first
following = people[2..3]
followers = people[3..4]
following.each { |followed| person.follow(followed) }
followers.each { |follower| follower.follow(person) }
