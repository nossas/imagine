class SessionsController < ApplicationController
  skip_authorization_check

  def create
    hash = request.env['omniauth.auth']
    user = User.find_by_uid(hash[:uid])
    if user
      user.update_attributes(
        :uid        => hash[:uid],
        :email      => hash[:info][:email],
        :first_name => hash[:info][:first_name], 
        :last_name  => hash[:info][:last_name],
        :token      => hash[:credentials][:token],
        :image      => hash[:info][:image]
      )
    else
      raise hash.inspect
      user = User.create!(
        :uid        => hash[:uid],
        :email      => hash[:info][:email],
        :first_name => hash[:info][:first_name], 
        :last_name  => hash[:info][:last_name],
        :token      => hash[:credentials][:token],
        :image      => hash[:info][:image]
      )
    end
    session[:user_id] = user.id
    if session[:idea_id]
      idea = Idea.find(session.delete(:idea_id))
      redirect_to create_from_session_problem_idea_votes_path(problem_id: idea.problem.id, idea_id: idea.id)
    elsif session[:contribution]
      idea = Idea.find(session[:contribution][:idea_id])
      redirect_to create_from_session_problem_idea_contributions_path(problem_id: idea.problem.id, idea_id: idea.id)
    else
      redirect_to session[:url] || root_path
    end
  end
end
