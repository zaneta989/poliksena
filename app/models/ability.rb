class Ability
    include CanCan::Ability

    def initialize(user)
      user ||= User.new
      if user.superadmin_role?
        can :manage, :all
        can :destroy, :all
        can :access, :all
      elsif user.supervisor_role?
        can :manage, Article
      else
        can :access, Article
        can :manage, Article
        can :access, Comment
        can :manage, Comment
        can :destroy, Article
        can :destroy, Comment
      end
    end
end

