class Users::SessionsController < Devise::SessionsController


  def show
    @user = User.find(params[:id] => :user)
  end

  def index
    @users = User.all
  end


end
