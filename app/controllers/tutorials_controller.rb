class TutorialsController < ApplicationController
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
    @tutorial = Tutorial.new(params[:tutorial])
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
end