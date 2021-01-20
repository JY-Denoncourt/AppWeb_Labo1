class Picture < ApplicationRecord
    has_one_attached :myPicture
    belongs_to :imageable, polymorphic: true
end
