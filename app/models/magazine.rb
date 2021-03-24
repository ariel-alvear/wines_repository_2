class Magazine < ApplicationRecord
  has_many :enologist_magazines
  has_many :enologist, through: :enologist_magazines
end
