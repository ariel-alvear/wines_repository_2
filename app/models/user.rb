class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :assignments
  has_many :roles, through: :assignments

  def is_admin?
    self.roles.first.name == 'admin'
  end

  def is_friend
    self.roles.first.name == 'friend'
  end

  def is_wine_expert
    self.roles.first.name == 'wine_expert'
  end
end
