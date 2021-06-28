class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:show, :destroy]

  def index
    @posts = Post.paginate(:per_page => 5,:page => params[:page]).includes(:photos, :user, :likes).
      order("created_at desc")
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      if params[:images]
        params[:images].each do |img|
          @post.photos.create(image: img[1])
        end
      end

      redirect_to posts_path
      flash[:notice] = "Comunicado enviado!"
    else
      flash[:alert] = "Algo deu errado"
      redirect_to posts_path
    end
  end

  def show
    @photos = @post.photos
    @likes = @post.likes.includes(:user)
    @comment = Comment.new
    @is_liked = @post.is_liked(current_user)
    @is_bookmarked = @post.is_bookmarked(current_user)
  end

  def destroy
    if @post.user == current_user
      if @post.destroy
        flash[:notice] = "Comunicado deletado!"
      else
        flash[:alert] = "Algo deu errado"
      end
    else
      flash[:notice] = "Você nao tem permissão para fazer isso!"
    end
    redirect_to root_path
  end

  private

  def find_post
    @post = Post.find_by id: params[:id]

    return if @post
    flash[:danger] = "Comunicado não existe!"
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit :content
  end
end
