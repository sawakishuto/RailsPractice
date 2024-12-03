class Post
  attr_reader :id, :title, :content, :user_id

  def initialize(id: , title: , content: , user_id:)
    @id = id
    @title = title
    @content = content
    @user_id = user_id
    validate!
  end

  private 
  def validate!
    raise "Title can't be blank" if title.strip.empty?
    raise "Content can't be blank" if content.strip.empty?
  end
end