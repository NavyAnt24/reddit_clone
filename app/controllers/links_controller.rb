class LinksController < ApplicationController
  before_filter :require_current_user!

  def new
    render :new
  end

  def create
    @link = Link.new(params[:link])
    @link.user_id = current_user.id

    if @link.save
      redirect_to link_url(@link)
    else
      flash[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
    render :show
  end
end
