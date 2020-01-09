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

  

  # def create
  #   @album = Album.new(album_params)
  #   @images = @album.images
  #   if @images.length != 0
  #     @album.save
  #     redirect_to group_albums_path(@group.id)
  #   else
  #     redirect_to  new_group_album_path(@group.id)
  #   end  
  # end


  # def create
  #   @album = Album.new(album_params)
  #   respond_to do |format|
  #     if @album.save
  #         params[:images][:image].each do |image|
  #           @image = Image.new(upload_file(@album,image))
  #           @image.save(image: image, album_id: @album.id, created_at: @album.created_at, updated_at:@album.updated_at)
  #         end
  #       format.html{redirect_to root_path}
  #     else
  #       @album.images.build
  #       format.html{render action: 'new'}
  #     end
  #   end
  # end

  def create
    puts album_params
    # .merge(images: photo_params[:images].collect{|p| {image: p}})
    @album = Album.new(album_params)
    respond_to do |format|
      if @album.save
        # print "photo_params[:images]"
        # puts photo_params[:images]
        # @album.images.create(image: photo_params[:images])
          # params[:images][:image].each do |a|
         
          photo_params[:images].each do |a|
            image = a
            @album.images.create(image: image)
          end
          #  @image = @album.images.create!(:image => a, :album_id => @album.id)
        # # end
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

  def show
    @photos = @album.images
    @picture = Image.new
  end

  def edit
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
