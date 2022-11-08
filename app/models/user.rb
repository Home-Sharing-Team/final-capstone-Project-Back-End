class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, :validatable,
  :jwt_authenticatable, jwt_revocation_strategy: self
  
  has_many :properties, dependent: :destroy
  has_many :reservations, dependent: :destroy  

  enum role: { user: 0, admin: 1 }

  def jwt_payload
    super.merge({ 'role' => role })
  end
end
