class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :image, :last_name
end
