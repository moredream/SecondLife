class WelcomeController < ApplicationController

  respond_to :html, :json

  def index
    @articles ||=  Article.trending
    respond_with(@articles) 
  end



end
