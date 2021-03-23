class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :assignments
  has_many :roles, through: :assignments

  def self.is_admin(x)
    self.find(x).roles.first.name == 'admin'
  end

  def self.is_friend(x)
    self.find(x).roles.first.name == 'friend'
  end

  def self.is_wine_expert(x)
    self.find(x).roles.first.name == 'wine_expert'
  end
end
