class PostsController < ApplicationController
  def index
    @author = Author.find params[:author_id]
    @posts = @author.posts
  end

  def new
    @author = Author.find params[:author_id]
    @post = Post.new
  end

  def show
    @post = Post.find params[:id]
    @author = @post.author
  end

  def create
    @author = Author.find params[:author_id]
    @post = Post.new post_params
    @post.author = @author 
    if @post.save
      redirect_to author_posts_path(@author)
    else 
      render :new 
    end
  end

  def edit
    @post = Post.find params[:id]
    @author = @post.author
  end

  def update
    @post = Post. find params[:id]
    @post.update_attributes post_params
    @author = @post.author

    if @post.save
      redirect_to post_path
    else
      render :edit 
    end
  end

def destroy
  post = Post.find params[:id]
  post.destroy
  redirect_to author_posts_path(post.author)
end

private
  def post_params
    params.require(:post).permit(:title, :body, :category, :author_id)

  end
  end 

