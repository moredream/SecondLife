class BackgroundsController < ApplicationController

  before_action :authenticate_user!, only: [:new]


  def new
  	@article = Article.new
    @uploader = Article.new.image
    @uploader.success_action_redirect = new_article_url
  end
end
