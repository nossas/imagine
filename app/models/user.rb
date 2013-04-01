class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :image, :last_name
  validates :email, :first_name, :presence => true
  validates :email, :uniqueness => true

  def name
    "#{first_name} #{last_name}"
  end
end
