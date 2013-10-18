class Ability
  include CanCan::Ability

  def initialize(user, request)
    can :read, Idea
    can :preview, Idea
    can :read, Problem
    can :pending_contributions, Contribution
    can :read, Update
    can :search, Problem

    if user
      can :create, Idea

      can :update, Idea do |idea|
        idea.user == user
      end
      can :destroy, Idea do |idea|
        idea.user == user
      end

      can :create, Contribution
      can :create, Vote
      can :accept, Contribution do |contribution|
        contribution.idea.user == user
      end
      can :reject, Contribution do |contribution|
        contribution.idea.user == user
      end
      if user.admin?
        can :manage, Idea
        can :manage, Problem
        can :manage, Update
      end
    end

    if request.format.json?
      if request.params[:token] == ENV["API_TOKEN"]
        can :index, Problem
        can :index, Idea
      else
        cannot :index, Problem
        cannot :index, Idea
      end
    end
  end
end
