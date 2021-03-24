class Wine < ApplicationRecord
    has_many :wine_strains, dependent: :destroy
    has_many :strains, through: :wine_strains, dependent: :destroy
    accepts_nested_attributes_for :wine_strains, allow_destroy: true

    validates :name, presence: true
    validates_associated :wine_strains
    validates_associated :strains

    has_many :wine_enologists, dependent: :destroy
    has_many :enologists, through: :wine_enologists, dependent: :destroy
end
