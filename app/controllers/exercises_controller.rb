class ExercisesController < ApplicationController
	before_filter :authenticate_user!, :except => [:show, :index]
  def index
    @exercises = Exercise.all
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = current_user.exercises.create(params[:exercise])
    
    if @exercise.save
      flash[:notice] = "Successfully created exercise."
      redirect_to @exercise
    else
      render :action => 'new'
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update_attributes(params[:exercise])
      flash[:notice] = "Successfully updated exercise."
      redirect_to exercise_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
    flash[:notice] = "Successfully destroyed exercise."
    redirect_to exercises_url
  end
  
  def upvote
		@exercise = Exercise.find(params[:id])
		@exercise.upvotes ++
		if(@exercise.save)
			flash[:notice] = "Successfully upvoted"
			redirect_to exercises-url
		else
			redirect_to exercises-url
		end
  end
  
  def downvote
		@exercise = Exercise.find(params[:id])
		@exercise.downvotes ++
		if(@exercise.save)
			flash[:notice] = "Successfully upvoted"
			redirect_to exercises-url
		else
			redirect_to exercises-url
		end
  end
end
