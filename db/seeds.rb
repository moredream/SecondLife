# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Group.delete_all
Group.create( name: 'Jobs Suggestion', level: 'default')
Group.create( name: 'Academic Career', level: 'success')
Group.create( name: 'Ask to mentors', level: 'primary')
Group.create( name: 'Questions' ,level:  'info')
Group.create( name: 'Talk' ,level: 'warning')
Group.create( name: 'Event', level: 'danger')