class Book < ApplicationRecord
    validates :title, uniqueness: true

    has_many :comments
    has_many :users, :through => :comments
end
