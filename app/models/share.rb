class Share < ApplicationRecord

  belongs_to       :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :likes,  dependent: :destroy
  has_many :users, through: :likes

 with_options presence: true do
  validates :title
  validates :share
  validates :image
 end

end
