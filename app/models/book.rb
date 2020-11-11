class Book < ApplicationRecord
    validates :title, uniqueness: true
    validates :title, presence: true
    validates :author, presence: true
    validates :page_count, presence: true
    validates :page_count, numericality: true
    validates :description, length: {minimum: 10}

    has_many :comments
    has_many :users, :through => :comments

    scope :alpha, -> { order(:title) }
    scope :with_comments, -> { joins(:comments).group(:book_id).order('count(:books_id)') }

    def comment_count
        self.comments.count
    end
end
