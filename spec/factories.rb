FactoryGirl.define do
	
	factory :user do 
		first_name "Mama"
    last_name "DooDoo"
    email "me@home.com"
    password "Some great password"
    admin false
	end

	factory :admin, class: User do
    first_name "Admin"
    last_name "User"
    admin true
  end

	factory :comment do
    body "This product is awesome!"
    rating 5
  end
  
  factory :product do
    name "Kiteboard"
    description "An awesome Kiteboard for all."
    image_url "board2.jpg"
    colour "pink"
  end

end

