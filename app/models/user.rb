class User < ActiveRecord::Base
	validates :password, :email, presence: true
	validates :email, uniqueness: true
	validates_confirmation_of :password
	has_secure_password
	
	has_many :posts
	has_many :comments		

	has_attached_file :avatar, :styles => {
	:medium => "200x200>",
	:small => "120x120#",
	:thumb => "75x75",
	:default_url => "http://www.adtechnology.co.uk/images/UGM-default-user.png"
}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


end
