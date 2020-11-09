class Book < ApplicationRecord
    validates :title, uniqueness: true
    validates :title, presence: true
    validates :author, presence: true
    validates :page_count, presence: true
    validates :page_count, numericality: true
    validates :description, length: {maximum: 100}

    has_many :comments
    has_many :users, :through => :comments

    scope :alpha, -> { order(:title) }

    def comment_count
        self.comments.count
    end
end
