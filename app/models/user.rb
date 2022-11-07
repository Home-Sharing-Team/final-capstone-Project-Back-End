class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :validatable
  
  has_many :properties, dependent: :destroy
  has_many :reservations, dependent: :destroy  

  enum role: { user: 0, admin: 1 }
end
