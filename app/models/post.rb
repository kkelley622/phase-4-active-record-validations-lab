class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 } 
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :sufficiently_clickbait

    CLICKBAIT = [
        /Won't Believe/i, 
        /Secret/i, 
        /Top \d/i, 
        /Guess/i]

    def sufficiently_clickbait
        if CLICKBAIT.none? { |bait| bait.match title }
            errors.add(:title, "Must be more clickbaity")
        end
    end
end
