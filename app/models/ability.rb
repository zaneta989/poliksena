class Ability
    include CanCan::Ability

    def initialize(user)
      user ||= User.new
      if user.superadmin_role?
        can :manage, :all
        can :access, :rails_admin
        can :dashboard
      elsif user.supervisor_role?
        can :manage, User
      else
        can :access, Article
      end
    end
end

