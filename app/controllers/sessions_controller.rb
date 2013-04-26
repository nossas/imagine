class SessionsController < ApplicationController
  skip_authorization_check

  def create
    hash = request.env['omniauth.auth']
    session[:user_id] = User.find_or_create_by_uid(
      hash[:uid],
      :uid        => hash[:uid],
      :email      => hash[:info][:email],
      :first_name => hash[:info][:first_name], 
      :last_name  => hash[:info][:last_name],
      :image      => hash[:info][:image]).id
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
