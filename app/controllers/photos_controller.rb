class PhotosController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    respond_to do |format|
      if @photo.save
        format.html { redirect_to photo_path(@photo), notice: 'Photo was successfully created' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
    raise
  end

  private

  def photo_params
    params.require(:photo).permit(:url)
  end
end
