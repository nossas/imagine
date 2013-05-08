class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Idea
    can :preview, Idea
    can :read, Problem
    can :pending_contributions, Contribution
    can :destroy, Idea

    if user
      can :create, Idea
      can :create, Contribution
      can :create, Vote
      can :accept, Contribution do |contribution|
        contribution.idea.user == user
      end
      can :reject, Contribution do |contribution|
        contribution.idea.user == user
      end
    end
  end
end
