class PostRepository
  include PostRepositoryInterface

  def find_by_id(id)
    record = PostRecord.find_by(id: id)
    to_entity(record)
  end

  def find_all_by_user(user_id)
    records = PostRecord.where(user_id: user_id)
    records.map { |record| to_entity(record) }
  end

  def save(post)
    record = post.id ? PostRecord.find(post.id) : PostRecord.new
    recofd.title = post.title
    record.content = post.content
    record.user_id = post.user_id
    record.save!
    to_entity(record)
  end


  private 
  
  def to_entity(record)
    Post.new(id: record.id, title: record.title, content: record.content)
  end
end