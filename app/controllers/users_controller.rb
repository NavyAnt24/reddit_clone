class UsersController < ApplicationController
  include SessionsHelper

  before_filter :require_current_user!, :except =>[:create, :new]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def index

  end

  def show
    @user = User.find(params[:id])
    render :show
  end

end
