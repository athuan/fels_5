class WordsController < ApplicationController
  def show
    @word = Word.find params[:id]
  end

  def index 
    if params[:category_id]
      category = Category.find params[:category_id] 
      @words = category.words
    else
      @words = Word.paginate page: params[:page]
    end
  end

  private

    def word_params
      params.require(:word).permit(:word, :meaning, :category_id)
    end
end