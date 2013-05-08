class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Idea
    can :preview, Idea
    can :read, Problem
    can :pending_contributions, Contribution

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
        can :destroy, Idea
        can :update, Idea
      end
    end
  end
end
