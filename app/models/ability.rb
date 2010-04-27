class Ability
   include CanCan::Ability

   def initialize(user)
     user ||= User.new # Guest user  
         if user.role? :superuser  
           can :manage, :all  
         else 
           if user.role? :administrator
            can :create, User
            can :update, User
           end
           can :read, :all  
         end
   end
 end