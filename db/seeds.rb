# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Group.delete_all
Group.create( name: 'Jobs', level: 'default')
Group.create( name: 'Academic Career', level: 'success')
Group.create( name: 'Exchange', level: 'primary')
Group.create( name: 'Questions' ,level:  'default')
Group.create( name: 'Talk' ,level: 'warning')
Group.create( name: 'Event', level: 'danger')


User.create(:email=>'test1@test.com',:name=>'test1',:password=>'password')
User.create(:email=>'test2@test.com',:name=>'test2',:password=>'password')
User.create(:email=>'test3@test.com',:name=>'test3',:password=>'password')