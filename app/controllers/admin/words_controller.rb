class Admin::WordsController < ApplicationController
  

  def new
    @word = Word.new
    4.times { @word.options.build }
  end

  def index
    if params[:category_id]
      category = Category.find params[:category_id] 
      @words = category.words
    else
      @words = Word.paginate page: params[:page]
    end
  end

  def show
    @word = Word.find params[:id]
  end

  def update
    @word = Word.find params[:id]
    if @word.update_attributes word_params
      flash[:success] = "Successful! Word updated."
      redirect_to [:admin, @word]
    else
      flash[:faild] = "Edit faild"
      render 'edit'
    end
  end

  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = "Create Successful!"
      redirect_to [:admin, @word]
    else
      flash[:faild] = "fail"
      render 'new'
    end
  end

  def edit
    @word = Word.find params[:id]
  end

  def destroy
    word= Word.find params[:id]
    word.destroy
    flash[:success] = "Word deleted."
    redirect_to admin_words_url
  end

  private
    def word_params
      params.require(:word).permit(:name, :description, :category_id, options_attributes: [:id, :word_id, :answer, :is_correct])
    end  
end