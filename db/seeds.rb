# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Ticket.create([
  {
    name: 'Charles Holdsworth',
    phone_number: '+14153674129',
    description: 'I played for Middlesex in the championships and my mallet squeaked the whole time! I demand a refund!'
  },
  {
    name: 'John Woodger',
    phone_number: '+15712812415',
    description: 'The mallet you sold me broke! Call me immediately!'
  },
])
