class SessionsController < ApplicationController
  def create
    hash = request.env['omniauth.auth']
    session[:user_id] = User.find_or_create_by_uid(
      hash[:uid],
      :uid        => hash[:uid],
      :email      => hash[:info][:email],
      :first_name => hash[:info][:first_name], 
      :last_name  => hash[:info][:last_name],
      :image      => hash[:info][:image]).id
    redirect_to session[:url]
  end
end
