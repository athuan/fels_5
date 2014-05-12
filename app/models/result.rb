class Result < ActiveRecord::Base

  before_save :update_lesson
  after_save :create_activity

  belongs_to :lesson
  belongs_to :word
  belongs_to :option

  def update_lesson
    if self.option.is_correct
      self.lesson.update_attributes result: self.lesson.result.to_i + 1
    end
  end

  def create_activity
    if self.lesson.results.count == self.lesson.number_questions
      Activity.create(user_id: self.lesson.user_id, lesson_id: self.lesson.id, finished_at: Time.now)
    end
  end

end
