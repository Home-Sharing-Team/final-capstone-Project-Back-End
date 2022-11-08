class User < ApplicationRecord
  has_many :properties, dependent: :destroy
  has_many :reservations, dependent: :destroy

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  enum role: %i[user admin]

  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :user
  end
end
