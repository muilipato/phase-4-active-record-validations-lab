class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  validate :title_contains_clickbait_phrases

  private

  def title_contains_clickbait_phrases
    unless title.present? && title.match?(/(Won't Believe|Secret|Top \d|Guess)/)
      errors.add(:title, 'must contain clickbait phrases')
    end
  end
end
