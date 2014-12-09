class Post < ActiveRecord::Base
	validates :title, :post, presence: true

	has_many :comments
	belongs_to :user

end
