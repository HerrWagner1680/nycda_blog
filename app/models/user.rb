class User < ActiveRecord::Base
	validates :password, :password_confirmation, :email, presence: true
	validates :email, uniqueness: true
	validates_confirmation_of :password
	has_secure_password
	
	has_many :posts
	has_many :comments		

	has_attached_file :avatar, :styles => {
	:medium => "200x200>",
	:small => "150x150#",
	:thumb => "100x100",
	:default_url => "http://www.adtechnology.co.uk/images/UGM-default-user.png"
}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


end
