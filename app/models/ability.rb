class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Idea
    can :preview, Idea
    can :read, Problem

    if user
      can :create, Idea
      can :create, Contribution
      can :create, Vote
    end
  end
end
