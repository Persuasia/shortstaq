class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order("created_at DESC")
  end

  def show
    @question = Question.find(params[:id])
  end


  def new
    @question = Question.new
  end


  def create
    @question = Question.new(params.require(:question).permit(:title, :body))
    @question.user_id = session[:user_id]
      if @question.save
        redirect_to questions_path
      else
        render :new
      end
  end


  def edit
    @question = Question.find(params[:id])
  end


  def update
    @question = Question.find(params[:id])

    if @question.update_attributes(params.require(:question).permit(:title,:body))
      redirect_to questions_path
    else
      render :edit
    end
  end


  def destroy
    @question = Question.find( question [:id])
    @question.destroy
    redirect_to questions_path
  end


end
