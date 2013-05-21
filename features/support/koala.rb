Before('@koala') do
  page_graph = double(:put_connections => {"id" => "123"})
  user_graph = double(:get_page_access_token => "page_token")
  Koala::Facebook::API.stub(:new).with("ASFGHJGHFGDSFDFGHDGF").and_return user_graph
  Koala::Facebook::API.stub(:new).with("page_token").and_return page_graph
end
