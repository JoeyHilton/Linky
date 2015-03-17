class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  def index
    @links = Links.all
  end

  def show
  end

  def new
    @link = Link.new
  end

  def create
    if @link.save
      redirect_to @link
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @link.update(link_params)
      redirect_to @link
    else
      render :edit
    end
  end

  def destroy
    @link.destroy
  end

  private

  def set_link
    @link = Link.find(params[:id])
  end

end
