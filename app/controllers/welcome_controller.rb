class WelcomeController < ApplicationController

  respond_to :html, :json

  def index

    @articles ||=  Article.follow_only(current_user, '') if current_user.present?
    respond_with(@articles) 
  end



end
