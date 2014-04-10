class PhotosController < ApplicationController
  before_action :load_attachable
  before_action :set_photo, only: [:show,  :destroy]

  def index
    @photos =  @attachable.photos.trending.page(params[:page]).per(10)
  end

  def new
    @photo   = @attachable.photos.build
  end

  def create
    @photo =  @attachable.photos.build(photo_params)
    @photo.user_id = current_user.id

    respond_to do |format|
    if @photo.save
      format.html { redirect_to @attachable , notice: 'photo was successfully created'}
      format.js
    else
      format.html { render 'new' }
    end

    end

  end

  def show

  end

  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to @attachable }
      format.json { head :no_content }
      format.js
    end
  end

private
  def load_attachable
    klass = [Article, Program, Event].detect { |c| params["#{c.name.underscore}_id"]}
    @attachable = klass.find(params["#{klass.name.underscore}_id"])
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:name, :image, :user_id)
  end
end
