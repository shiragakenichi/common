class AlbumsController < ApplicationController
  before_action :set_group
  before_action :set_album, only: [:show,  :edit, :destroy, :update ]

  def index
    @albums = @group.albums
  end

  def new
    @album = Album.new
    @album.images.build
  end


  def create
    puts album_params
    # .merge(images: photo_params[:images].collect{|p| {image: p}})
    @album = Album.new(album_params)
    respond_to do |format|
    if params[:images] == nil
      @album.images.build
      format.html{render action: 'new'}
    else
      if @album.save
          photo_params[:images].each do |a|
            image = a
            @album.images.create(image: image)
          end
        @user = current_user
        amessage = @user.nickname + 'がアルバムを作成しました'
        @message = Message.new(content: amessage , group_id: @group.id , user_id: @user.id,efect_id: @album.id)
        @message.save
        format.html{redirect_to group_messages_path(@group.id)}
      else
        @album.images.build
        format.html{render action: 'new'}
      end
    end
   end
  end

  def show
    @photos = @album.images
    @picture = Image.new
  end

  def edit
    @images = @album.images
  end

  def update
    @album.update(album_params)
    # respond_to do |format|
      if params[:images] == nil
        # @images = @album.images
        # @images.build
        # format.html{render action: 'edit'}
        redirect_to edit_group_album_path(@group.id,@album.id)
      else
        if @album.save
            photo_params[:images].each do |a|
              image = a
              @album.images.create(image: image)
            end
          @user = current_user
          amessage = @user.nickname + 'がアルバムを更新しました。'
          @message = Message.new(content: amessage , group_id: @group.id , user_id: @user.id,efect_id: @album.id)
          @message.save
          redirect_to group_album_path(@group.id,@album.id)
        else
          redirect_to edit_group_album_path(@group.id,@album.id)
          # @images = @album.images
          # @images.build
          # format.html{render action: 'edit'}
        end
    end
  end


 


    private
    def set_group
      @group = Group.find(params[:group_id])
    end

    def set_album
      @album = Album.find(params[:id])
    end

    def photo_params
      params.require(:images).permit(images: [])
    end


    def album_params
      params.require(:album).permit(
        :name)
      .merge(group_id: @group.id)
      # images_attributes: [:images]
    end
end
