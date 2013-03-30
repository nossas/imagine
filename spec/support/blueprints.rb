require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

Problem.blueprint do
  title           { "Title #{sn}" }
  description     { "Description" }
  image           { "http://www.abeoc.org.br/wp-content/uploads/2012/07/Rio-de-Janeiro.jpg" }
  ideas_deadline  { Time.now + 1.month }
  voting_deadline { Time.now + 2.months }
end

Idea.blueprint do
  title       { "Title #{sn}" }
  description { "Description" }
  problem     { Problem.make! }
  user        { User.make! }
end

User.blueprint do
  first_name  { "First Name #{sn}" }
  last_name   { "Last Name #{sn}" }
  email       { "#{sn}@imagi.ne" }
  image       { "http://userserve-ak.last.fm/serve/_/6773/Paul+McCartney.jpg" }
end
