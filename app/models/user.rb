#require 'bcrypt'

class User < ActiveRecord::Base
 has_secure_password
 # attr_accessor :password_digest
 #include BCrypt
=begin
  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
=end
end
