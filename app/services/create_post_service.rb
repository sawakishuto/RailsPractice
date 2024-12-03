class CreatePostService
  def initialize(post_repository, user_repository)
    @post_repository = post_repository
    @user_repository = user_repository
  end

  def execute(title:, content:, user_id:)
    user = @user_repository.find_by_id(user_id)
    raise "User not found" unless user
    
    post = Post.new(title: title, content: content, user_id: user.id)
    @post_repository.save(post)
  end
end