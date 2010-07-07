require 'machinist/active_record'

#Sham.name { Faker::Lorem.words(1).first.downcase}
#Sham.year {}

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

# TaxonName blueprint
TaxonName.blueprint do
  scientific_name {"name 1"}
  authorship_year { Random.new.rand(1990..2010)}
  

end
