class SearchesController < ApplicationController

before_action :authenticate_user! 
def index

end

def new
  @search = Search.new
end

def create
  # @search = Search.create!(search_params)
  @search = Search.save_search(search_params)
  
  redirect_to @search
end

def show
  @search ||= Search.find(params[:id])
end

private

  def search_params
    params.require(:search).permit(:keywords,:group_id)
  end

  def groups
    @groups ||= Group.cached_groups
  end

helper_method :groups

 #  def articles
	# if params[:keywords] || params[:group_id]
 #      @articles ||= Article.search_tags(params[:keywords], params[:group_id]).page(params[:page]).per(10)
 #    else
 #      @articles ||= Article.trends('100').page(params[:page]).per(10)
 #    end
 #  end

 #  helper_method :articles
end
