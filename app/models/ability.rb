class Ability
    include CanCan::Ability

    def initialize(user)
      if user==nil
        can :read, :all
      elsif user.superadmin_role?
        can :manage, :all
        can :destroy, :all
        can :access, :all
      elsif user.supervisor_role?
        can :manage, Article
      elsif user.user_role?
        can :read, :all
        can :create, Article
        can [:update, :destroy], Article, :author => user.username
        can :create, Comment
        can :destroy, Comment, :user_id => user.id
      end
    end
end

