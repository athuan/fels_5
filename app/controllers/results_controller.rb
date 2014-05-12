class ResultsController < ApplicationController

  def new
    @result = Result.new
    @lesson = Lesson.find params[:lesson_id]
    lesson_words = @lesson.lesson_words
    results = @lesson.results
    lesson_word = get_word lesson_words, results
    if lesson_word.present?
      @word = Word.find lesson_word
      @options = @word.options
    else
      redirect_to lesson_path(@lesson)
    end
  end

  def create
    @result = Result.new result_params
    @result.option_id = params[:option_id]
    if @result.save
      redirect_to :back
    else
      flash[:fail] = "fail"
      render "new"
    end
  end

  private
    def result_params
      params.require(:result).permit(:lesson_id, :choosen, :word_id)
    end

    def get_word lessonWords, results
      if !results.present?
        return lessonWords.first
      end
      lesssonWord_ids = Array.new
      result_ids = Array.new
      lessonWords.each do |lessonWord|
        lesssonWord_ids.push(lessonWord.word_id)
      end
      results.each do |result|
        result_ids.push(result.word_id)
      end
      (lesssonWord_ids - result_ids).first
    end 

end