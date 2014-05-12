class Lesson < ActiveRecord::Base

  after_create :create_activity
  has_many :results
  has_many :activities
  has_many :lesson_words
  has_many :words, through: :results
  has_many :words, through: :lesson_words
  belongs_to :category
  
  def create_activity
    Activity.create(user_id: user_id, lesson_id: id)
  end
end

