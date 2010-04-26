class Ability
  include Cancan::Ability

  def initialize(user)
    user ||= User.new #Guest user
    can :read, :all
  end
end