class CommentsController < ApplicationController
  before_action :load_commentable, :authenticate_user!
  before_action :set_comment, only: [:destroy]

  def index
    @comments = @commentable.comments.trending.page(params[:page]).per(10)
  end

  def new
    @comment = @commentable.comments.new

  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: "Comment created." }
        format.js
      else
        render 'new'
      end
    end


  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @commentable }
      format.js
    end

  end


private

  def load_commentable
    klass = [Article, Program, Event].detect { |c| params["#{c.name.underscore}_id"]}
    @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

end
