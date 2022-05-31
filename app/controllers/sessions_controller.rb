class SessionsController < ApplicationController
  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:notice] = "You've signed in."
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem signing in. Please try again."
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've signed out."
    redirect_to "/"
  end

  def show
    if current_user
      flash[:alert] = 'You are authenticated'
      @pokemon = HTTParty.get('https://pokeapi.co/api/v2/pokemon-species/cubone')
      render :success
    else
      render :failure
    end
  end
end