class Article < ApplicationRecord
    include Visible

    has_many :comments, dependent: :destroy
    has_one :picture, :as => :imageable
    accepts_nested_attributes_for :picture
    

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }


    def have_picture?
        return self.picture && self.picture.image.attached?
    end
end
