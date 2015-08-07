
class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def contact_form(email, name, message)
	@message = message
  	mail(:from => email, 
	  		:to => 'keniset@gmail.com', 
	  		:subject => "A new contact form message from #{name}")
  end

  def payment(email, message)
  	mail(:from => 'shop@ArubaKiteboarding.com',
  				:to => email,
  				:subject => "ArubaKiteboarding Store")
  end

end
