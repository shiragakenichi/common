class AlbumsController < ApplicationController
  before_action :set_group

  def index
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
    @album = Album.new(album_params)
    respond_to do |format|
      if @album.save
          # params[:images][:image].each do |a|

          #  @image = @album.images.create!(:image => a, :album_id => @album.id)
        # # end
        @user = current_user
        amessage = @user.nickname + 'がアルバムを作成しました'
        @message = Message.new(content: amessage , group_id: @group.id , user_id: @user.id )
        @message.save
        format.html{redirect_to root_path}
      else
        @album.images.build
        format.html{render action: 'new'}
      end
    end
  end

  def edit
    @album = Album.find(params[:album_id])
  end


  def upload_file(m,image)
    printer = m
    @product_photo = printer.create(photo_params)
    return @product_photo
  end

 


    private
    def set_group
      @group = Group.find(params[:group_id])
    end

    def photo_params
      params.require(:images).permit(:image)
    end


    def album_params
      params.require(:album).permit(
        :name,
        images_attributes: [:images])
      .merge(group_id: @group.id)
    end
end
