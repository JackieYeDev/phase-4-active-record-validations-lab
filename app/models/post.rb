class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :not_valid_titles
    
    PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]

    def not_valid_titles
        if PATTERNS.none? { |pat| pat.match title }
            errors.add(:title, "Invalid title")
        end
    end
end
