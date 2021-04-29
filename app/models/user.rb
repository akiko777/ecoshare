class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


   with_options presence: true do
     validates :nickname
     validates :profile
     validates :password_confirmation
   end

   with_options format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i } do
     validates :password
     validates :password_confirmation
   end

   has_many :shares, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :likes, dependent: :destroy

  def already_liked?(share)
    self.likes.exists?(share_id: share.id)
  end

end
