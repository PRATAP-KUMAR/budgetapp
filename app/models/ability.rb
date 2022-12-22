class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, :all if user.role == 'admin'
    can :manage, :all if user.role == 'default'
  end
end
