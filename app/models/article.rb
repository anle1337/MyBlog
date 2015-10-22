class Article < ActiveRecord::Base

	validates :title, presence: true
	validates :body, presence: true, length: { minimum: 5 }
end
