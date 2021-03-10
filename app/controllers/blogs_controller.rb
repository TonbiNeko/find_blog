class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "Blogを保存しました"
    else
      render :new, notice: "保存出来ませんでした"
    end
  end

  def show
  end

private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
