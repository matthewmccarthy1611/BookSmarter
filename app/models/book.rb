class Book < ApplicationRecord
    validates :title, uniqueness: true
    validates :author, presence: true
    validates :page_count, presence: true
    validates :description, length: {maximum: 100}

    has_many :comments
    has_many :users, :through => :comments
end
