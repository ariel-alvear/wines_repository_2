class Enologist < ApplicationRecord
    has_many :enologist_magazines
    has_many :magazines, through: :enologist_magazines
end
