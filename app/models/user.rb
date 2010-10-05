class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

	validates_presence_of :username
	
	has_many :entries
	
	def to_s
		name || username
	end
	
	
	validates_presence_of :password, :if => :password_required?
	validates_uniqueness_of :username
  validates_confirmation_of :password
  validates_length_of       :password, :within => 4..100, :allow_blank => true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :username

	def password_required?
    !password.nil? || !password_confirmation.nil?
  end

end
