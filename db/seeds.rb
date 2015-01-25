# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
3.times do | i |
  company = Company.create(name: "Company ##{i + 1}", description: "Description ##{i + 1}", website: "http://website#{i + 1}.com")
  3.times do | j |
    company.jobs << Job.new(title: "Job ##{j + 1}", brief_description: "A brief description ##{j + 1}.", description: "Description ##{j + 1}")
    company.save
  end
end
