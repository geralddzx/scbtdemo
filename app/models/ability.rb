class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.master?
    	can :manage, :all
    elsif user.admin?
      can :manage, :all
      cannot [:destroy, :update], User do |user|
      	user.admin?
      end
    else 
      can :read, News
      can :read, Event do |event|
        event.display
      end
    end
    can :create, Inquiry
  end
end