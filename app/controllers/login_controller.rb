class LoginController < ApplicationController
  
  def login
    @user = User.new
  end

  def create
   # count = 0
   p params[:id]
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      flash[:notice] = "Succesful Login"
     # count += 1
     # last_login = Time.now
      redirect_to games_path
    else
      flash[:notice] = "Authentication failed"
      redirect_to root_path
    end
  end

end

