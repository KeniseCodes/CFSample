class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 

  has_many :orders

	def create_a_customer
	  token = params[:stripeToken]

		# Create a Customer
		customer = Stripe::Customer.create(
		  	:card => token,
  			:email => self.email
	)
		save!
	end

end
