class User
  attr_reader :id, :email, :password, :password_confirmation

  def initialize(id:  ,email: , password: , password_confirmation: )
    @id = id
    @email = email
    @password = password
    @password_confirmation = password_confirmation
    validate!
  end

  private

  def validate!
    raise "Email is invalid" unless email =~ URI:: MailTo::EMAIL_REGEXP
    raise "Name can't be blank" if name.strip.empty?
  end

end