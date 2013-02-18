class UsersController < ApplicationController

def show

end

def new
  	@user= User.new
end


def create 
   @user=User.new(:params[:user])
   if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end

end

def update 

end

def destroy

end

end
