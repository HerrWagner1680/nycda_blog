class Users < ActiveRecord::Base
	# validates :email, presence: true
	# validates :email, uniqueness: true
	
	has_many :posts
	has_many :comments		

end
