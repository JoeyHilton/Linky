class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_link
  def new
    @comment = @link.comments.build
  end

  def create
    @comment = @link.comments.build(comment_params)
    if @comment.save
      redirect_to @link
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    if @comment.user != current_user
      redirect_to @link, notice: "Nope"
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @link
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      redirect_to @link
    else
      redirect_to @link, notice: "Nope"
    end  
  end

  private

  def set_link
    @link = Link.find(params[:link_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :link_id)
  end
end
