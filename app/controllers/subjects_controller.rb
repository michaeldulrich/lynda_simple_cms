class SubjectsController < ApplicationController


  before_action :count_subjects, :only => [:new, :create, :edit, :update]

  layout 'admin'

  def index
    logger.debug("*** Testing the logger. ***")
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => 'Default'})
    # you could put a default value after .new, like Subject.new({:name => 'Default'})
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:notice] = "The subject '#{@subject.name}' was created successfully."
      redirect_to(subjects_path)
    else
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:notice] = "The subject '#{@subject.name}' was updated successfully."
      redirect_to(subject_path(@subject))
    else
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "The subject '#{@subject.name}' was destroyed successfully."
    redirect_to(subjects_path)
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible, :created_at)
  end

  def count_subjects
    @subject_count = Subject.count
    if params[:action] == 'new' || params[:action] == 'create'
      @subject_count += 1
    end
  end

end
