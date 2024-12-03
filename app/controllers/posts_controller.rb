class PostsController < ApplicationController
  def create 
    service = CreatePostService.new(PostRepository.new, UserRepository.new)
    post = service.execute(
      title: params[:title],
      content: params[:content],
      user_id: params[:user_id]
    )
    render json: post, status: :created
  end
end