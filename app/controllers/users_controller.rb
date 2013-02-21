class UsersController < ApplicationController
include SessionHelper

def show

end

def new
  	@user= User.new
end

def create 
   @user=User.new(params[:user])
   if @user.save
      sign_in @user
      flash[:success] = "Welcome to the iblog!"
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
