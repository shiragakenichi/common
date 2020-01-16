class PhotosController < ApplicationController
  before_action :set_group
  before_action :set_album
  before_action :set_photo,only:[:show, :destroy]
  def show
   
  end

  def destroy
    @photo.destroy
    redirect_to edit_group_album_path(@group.id,@album.id)
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_album
    @album = Album.find(params[:album_id])
  end

  def set_photo
    @photo = Image.find(params[:id])
  end
end
