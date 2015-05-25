FactoryGirl.define do
	
	factory :contact do |f| 
		f.firstname "Marie" 
		f.lastname "Antoinette" 
		email "marie@france.com"
		password "CakeCake"
		admin false
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
