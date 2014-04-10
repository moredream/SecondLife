class ArticlesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def index

  end

  def search

  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article , notice: 'Program was successfully created'
    else
      render 'new'
    end
  end

  def show
    @commentable = @article
    @comment = Comment.new
    @attachable = @article
    @photos = @attachable.photos
    @voter = current_user

  end

  def edit

  end

  def update
      if @article.update(article_params)
        redirect_to @article, notice: 'Program was successfully updated.'
      else
        render  'edit'
      end
  end

  def destroy
    @article.destroy
    redirect_to articles_url
  end

  def upvote

    respond_to do |format|
      if @article.liked_by current_user
        format.html { redirect_to @article, notice: "Thanks for vote!" }
        format.js
      else
        render @article
      end
    end
  end

  def downvote

    respond_to do |format|
      if  @article.downvote_from current_user
        format.html { redirect_to @article, notice: "Thanks for vote!" }
        format.js
      else
        render @article
      end
    end
  end


private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :image,:group_ids=>[])
  end

  def groups
    # @groups ||= Group.order(:name)
    @groups ||= Group.cached_groups
  end

  helper_method :groups


  def articles
    if params[:group]
      @articles = Article.group_with(params[:group]).page(params[:page]).per(10)
    elsif params[:q] || params[:group_id]
      @articles ||= Article.search_tags(params[:q], params[:group_id]).page(params[:page]).per(10)
    else
      @articles ||= Article.trends('100').page(params[:page]).per(10)
    end

  end

  helper_method :articles
end
