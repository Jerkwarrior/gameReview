# Frozen_string_literal: true

class UserController < ApplicationController # :nodoc:
  before_action :authenticate_user!

  def index; end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        html_redirect_user('created')
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        html_redirect_user('updated')
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html do
        redirect_to users_url,
                    notice: 'User was successfully destroyed.'
      end
    end
  end

  private

  def html_redirect_user(action)
    format.html do
      redirect_to visitor_path(@user),
                  notice: "User was successfully #{action}."
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, :avatar, :password)
  end
end
