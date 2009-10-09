class DepartmentsController < ApplicationController
  before_filter :find_department, :only => [:edit, :update, :destroy]

  def index
    @departments = Department.all
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.create params[:department]
    if @department.valid?
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
    @department.update_attributes params[:department]
    if @department.valid?
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def destroy
    @department.destroy
  end

  def sort
    Department.sort params[:departments].split(',')
  end

private
  def find_department
    @department = Department.find params[:id]
  end
end
