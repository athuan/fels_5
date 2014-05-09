class Word < ActiveRecord::Base
  belongs_to :category
  has_many :results
  has_many :lesson_words
  has_many :lessions, through: :results
  validates :category_id, presence: true
  has_many :options, dependent: :destroy

  scope :generate_random_word, ->(category_id) do
    where(category_id: category_id).order("rand()").limit(20)
  end 
end
