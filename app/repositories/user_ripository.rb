class UserRepository
  include UserRepositoryInterface

  def find_by_id(id)
    record = UserRecord.find_by(id: id)
    to_entity(record)
  end

  def find_by_email(email)
    record = UserRecord.find_by(email: email)
    to_entity(record)
  end

  def save(user)
    record = user.id ? UserRecord.find(user.id) : UserRecord.new
    record.email = user.email
    record.name = user.name
    record.save!
    to_entity(record)
  end


  private 

  def to_entity(record)
    User.new(id: record.id, email: record.email, name: record.name)
  end


end