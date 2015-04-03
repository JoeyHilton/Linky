class LinksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_link, only: [:show, :edit, :update, :destroy, :vote]
  def index
    @links = Link.all.order(votes: :desc)
  end

  def show
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to @link
    else
      render :new
    end
  end

  def edit
    if @link.user != current_user
      redirect_to @link, notice: "Nope"
    end
  end

  def update
    if @link.update(link_params)
      redirect_to @link
    else
      render :edit
    end
  end

  def destroy
    if @link.user == current_user
      @link.destroy
    else
      redirect_to @link, notice: "Nope"
    end
  end

  def vote
    if params[:vote] = "up"
      @link.upvote
    elsif params[:vote] = "down"
      @link.downvote
    end  
    redirect_to @link
  end

  private

  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:title, :url, :votes, :user_id, :category)
  end

end
