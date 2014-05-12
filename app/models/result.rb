class Result < ActiveRecord::Base

  before_save :update_lesson

  belongs_to :lesson
  belongs_to :word
  belongs_to :option

  def update_lesson
    if self.option.is_correct
      self.lesson.update_attributes result: self.lesson.result.to_i + 1
    end
  end

end
