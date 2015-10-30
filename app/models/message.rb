class Message < ActiveRecord::Base
	validates :name, presence: true, length: {minimum: 2}
	validates :subject, presence: true, length: {minimum: 2}
	validates :email, presence: true
	validates :body, presence: true, length: {minimum: 10}
end
