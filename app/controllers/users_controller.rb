class UsersController < InheritedResources::Base
  #Using InheritedResources doesnt require all the blurb - need to overwrite the specific actions if one wants more functionality
  respond_to :html, :xml, :json

  def new
    new!
    #@user.roles.build
  end

  def create
    debugger
    create!
   # @user.roles << params[:role]
   # @user.save
  end

end
