class QuestionsController < ApplicationController
  before_action :find_question , only: %i[show destroy edit update]
 
  def show 
   @answer = @question.answers.build 
   @pagy, @answers = pagy @question.answers.order(created_at: :desc)
  #  @answers = @question.answers.order(created_at: :desc).page params[:page]
  end 

  def edit 
    
  end 

  def index
    @pagy, @questions = pagy Question.order(created_at: :desc)
    # @questions = Question.order(created_at: :desc).page params[:page]
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = "Вопрос создан!"
      redirect_to questions_path
    else
      render :new
    end
  end

  def update   
    if @question.update question_params
      flash[:success] = "Вопрос обновлен!"
      redirect_to questions_path
    else
      render :edit
    end
  end 

  def destroy
    @question.destroy
    flash[:success] = "Вопрос удален"
    redirect_to questions_path
  end 

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
  def find_question 
    @question = Question.find(params[:id])
  end 
end
