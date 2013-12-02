if Rails.env.test?
  ENV['API_TOKEN'] = "test"
end
