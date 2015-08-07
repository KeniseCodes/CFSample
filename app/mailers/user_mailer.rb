
class UserMailer < ActionMailer::Base


  def contact_form(email, name, message)
  	@email = email
  	@name = name
		@message = message
  	mail(:from => @email,
	  		:to => 'keniset@gmail.com', 
	  		:subject => "A new contact form message from #{name}")
  end

  def payment(email, product)
  	@email = email
  	@product = product
  	mail(from: "shop@ArubaKiteboarding.com",
  				:to => @email,
  				:subject => "ArubaKiteboarding Store")
  end

end
