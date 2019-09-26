
# create the project example


5.times do 
  project = Project.create(title:Faker::Company.name )
  3.times do
    project.items.create(action:Faker::Company.catch_phrase )
  end
end