class PostsController < ApplicationController
    # 全投稿を取得
    def index
      posts = Post.all
      render json: posts
    end
  
    # 特定の投稿を取得
    def show
      post = Post.find(params[:id])
      render json: post
    end
  
    # 新しい投稿を作成
    def create
      post = Post.new(post_params)
      if post.save
        render json: post, status: :created
      else
        render json: post.errors, status: :unprocessable_entity
      end
    end
  
    # 投稿を更新
    def update
      post = Post.find(params[:id])
      if post.update(post_params)
        render json: post
      else
        render json: post.errors, status: :unprocessable_entity
      end
    end
  
    # 投稿を削除
    def destroy
      post = Post.find(params[:id])
      post.destroy
      head :no_content
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :content)
    end
  end
  