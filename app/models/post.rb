class Post < ActiveRecord::Base
	validates :title, :text, :user_id, presence: true

	has_many :comments
	belongs_to :user

end
