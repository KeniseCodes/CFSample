class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates :body, presence: true
  validates :rating, presence: true, numerically: { only_integer: true }
  self.per_page = 5

end
