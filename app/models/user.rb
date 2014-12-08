class User < ActiveRecord::Base
	# validates :email, presence: true
	# validates :email, uniqueness: true
	
	has_many :posts
	has_many :comments		

	has_attached_file :avatar, :styles => {
	:medium => "200x200>",
	:small => "150x150#",
	:thumb => "100x100",
:default_url => lambda { |avatar| ActionController::Base.helpers.asset_path('avatar.jpg') }
}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


end
