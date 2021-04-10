class Share < ApplicationRecord

  belongs_to :user

 with_options presence: true do
  validates :title
  validates :share
  validates :image
 end

end
