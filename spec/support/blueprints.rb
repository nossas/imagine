require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

Problem.blueprint do
  title           { Faker::Lorem.sentence(10) }
  description     { Faker::Lorem.paragraphs(3).join("\n\n") }
  image           { File.open("#{Rails.root}/features/support/problem.jpeg") }
  ideas_deadline  { Time.now + 1.month }
  voting_deadline { Time.now + 2.months }
  user            { User.make! }
  objectives      { Faker::Lorem.paragraph }
end

Idea.blueprint do
  title       { Faker::Lorem.sentence(5) }
  description { Faker::Lorem.paragraphs(5).join("\n\n") }
  problem     { Problem.make! }
  user        { User.make! }
end

User.blueprint do
  first_name  { Faker::Name.first_name }
  last_name   { Faker::Name.last_name }
  email       { Faker::Internet.email }
  image       { "http://lorempixel.com/50/50/people/#{sn.to_i}" }
  token       { "ASFGHJGHFGDSFDFGHDGF" }
end

Vote.blueprint do
  # Attributes here
  idea        { Idea.make! }
  user        { User.make! }
end

Contribution.blueprint do
  body  { Faker::Lorem.paragraphs(3).join("\n\n") }
  idea  { Idea.make! }
  user  { User.make! }
end

Update.blueprint do
  title   { Faker::Lorem.sentence }
  body    { Faker::Lorem.paragraphs(3).join("\n\n") }
  lead    { Faker::Lorem.paragraphs(3).join("\n\n") }
  image   { File.open("#{Rails.root}/features/support/problem.jpeg") }
  problem { Problem.make! }
  user    { User.make! }
end
