class InfoController < ApplicationController

  before_action :authenticate_user!, only: [:intro]

  def about
  end

  def privacy
  end

  def terms
  end

  def contact
  end

  def intro
    current_user.create_profile if current_user.profile.nil?
  end

end
