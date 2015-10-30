class ContactForm < ApplicationMailer

default from: "An Le <asble@ucdavis.edu>"
default to: "An Le <asble@ucdavis.edu>"

	def new_message(message)
		@message = message

		mail subject: "Message from #{message.name} via your Blog"
	end
end


