class TutorialsController < ApplicationController
	before_filter :authenticate_user!, :except => [:show, :index]
  def index
	
	@tutorials = Tutorial.all
    
  end

  def show
    @tutorial = Tutorial.find(params[:id])
  end

  def new
    @tutorial = Tutorial.new
  end

  def create
	
		@tutorial = current_user.tutorials.create(params[:tutorial])
		
	
    #@tutorial = Tutorial.new(params[:tutorial])
    #@tutorial.created_by = 1;

    if @tutorial.save
		flash[:notice] = "Successfully created tutorial."
		redirect_to @tutorial
    else
      render :action => 'new'
    end
  end

  def edit
    @tutorial = Tutorial.find(params[:id])
  end

  def update
    @tutorial = Tutorial.find(params[:id])
    if @tutorial.update_attributes(params[:tutorial])
      flash[:notice] = "Successfully updated tutorial."
      redirect_to tutorial_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @tutorial = Tutorial.find(params[:id])
    @tutorial.destroy
    flash[:notice] = "Successfully destroyed tutorial."
    redirect_to tutorials_url
  end
  
  def upvote
		@tutorial = Exercise.find(params[:id])
		@tutorial.upvotes ++
		if(@tutorial.save)
			flash[:notice] = "Successfully upvoted"
			redirect_to tutorials-url
		else
			redirect_to tutorials-url
		end
  end
  
  def downvote
		@tutorial = Exercise.find(params[:id])
		@tutorial.downvotes ++
		if(@tutorial.save)
			flash[:notice] = "Successfully upvoted"
			redirect_to tutorials-url
		else
			redirect_to tutorials-url
		end
  end
end
