class Enologist < ApplicationRecord
    has_many :enologist_magazines, dependent: :destroy
    has_many :magazines, through: :enologist_magazines, dependent: :destroy

    has_many :wine_enologists, dependent: :destroy
    has_many :wines, through: :wine_enologists, dependent: :destroy
end
