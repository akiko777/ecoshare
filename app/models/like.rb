class Like < ApplicationRecord

  belongs_to :user
  belongs_to :share
  
  validates_uniqueness_of :share_id, scope: :user_id
end
