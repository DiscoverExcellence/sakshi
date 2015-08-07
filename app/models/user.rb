#require 'bcrypt'

class User < ActiveRecord::Base

  has_many :tournaments, dependent: :destroy
  has_many :players, dependent: :destroy
  #enum role: [:user, :tnmt_manager, :player_manager, :admin]
  ROLES = %i[user tournament_manager player_manager admin]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
 #has_secure_password
 # attr_accessor :password_digest
end
