class Comment < ActiveRecord::Base
	belongs_to :post
	belongs_to :user

	has_attached_file :avatar, :styles => {
	:medium => "200x200>",
	:small => "150x150#",
	:thumb => "100x100",
	:default_url => "/images/:style/missing.png"
}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
